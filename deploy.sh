#!/bin/zsh
set -euo pipefail

# --- mkdocs detection ---
MKDOCS_BIN="$(command -v mkdocs || true)"
if [[ -z "${MKDOCS_BIN}" ]]; then
  if [[ -x "/Library/Frameworks/Python.framework/Versions/3.12/bin/mkdocs" ]]; then
    MKDOCS_BIN="/Library/Frameworks/Python.framework/Versions/3.12/bin/mkdocs"
  else
    echo "mkdocs not found in PATH"; exit 1
  fi
fi

# --- project root check ---
if [[ ! -f "mkdocs.yml" ]]; then
  echo "mkdocs.yml not found. Run from project root."; exit 1
fi

# --- prefer SSH remote for GitHub (avoids HTTPS RPC/HTTP 400 on push) ---
# If SSH auth is configured, switch origin to SSH; otherwise keep HTTPS.
ORIGIN_FETCH_URL="$(git remote get-url origin 2>/dev/null || true)"
ORIGIN_PUSH_URL="$(git remote get-url --push origin 2>/dev/null || true)"
ORIGIN_URL="${ORIGIN_PUSH_URL:-${ORIGIN_FETCH_URL}}"
if [[ -n "${ORIGIN_URL}" && "${ORIGIN_URL}" == https://github.com/* ]]; then
  SSH_TEST_OUT="$(ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new -o ConnectTimeout=5 -T git@github.com 2>&1 || true)"
  if echo "${SSH_TEST_OUT}" | grep -Eqi "successfully authenticated|^Hi [^!]+!"; then
    SSH_URL="${ORIGIN_URL/https:\/\/github.com\//git@github.com:}"
    echo "Switching origin to SSH (fetch+push): ${SSH_URL}"
    git remote set-url origin "${SSH_URL}"
    git remote set-url --push origin "${SSH_URL}"
  else
    echo "SSH to GitHub not ready; keeping HTTPS. ssh -T output: ${SSH_TEST_OUT}"
  fi
fi

# --- optional GitHub login via gh (only needed for HTTPS remotes) ---
ORIGIN_URL="$(git remote get-url origin 2>/dev/null || true)"
if [[ -n "${ORIGIN_URL}" && "${ORIGIN_URL}" == https://github.com/* ]]; then
  if command -v gh >/dev/null 2>&1; then
    if ! gh auth status -h github.com >/dev/null 2>&1; then
      echo "Logging into GitHub via browser..."
      gh auth login --hostname github.com --web --git-protocol https >/dev/null
    fi
  fi
fi

# --- branch check ---
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "${CURRENT_BRANCH}" != "main" ]]; then
  echo "Current branch is '${CURRENT_BRANCH}'. Switching to 'main'..."
  git checkout main
fi

# --- stage changes ---
git add -A

# --- commit message (from arg or auto) ---
USER_MSG="${1:-}"
if git diff --cached --quiet; then
  echo "No staged changes. Will still push & deploy current 'main'."
  AUTO_MSG="no-file-changes $(date +'%Y-%m-%d %H:%M')"
else
  if [[ -z "${USER_MSG}" ]]; then
    FILES_LIST="$(git diff --cached --name-only | head -n 15 | tr '\n' ' ')"
    FILES_COUNT="$(git diff --cached --name-only | wc -l | tr -d ' ')"
    AUTO_MSG="update (${FILES_COUNT} files) $(date +'%Y-%m-%d %H:%M'): ${FILES_LIST}"
    COMMIT_MSG="${AUTO_MSG}"
  else
    COMMIT_MSG="${USER_MSG}"
    AUTO_MSG="${USER_MSG}"
  fi
  git commit -m "${COMMIT_MSG}"
fi

# --- push main ---
git push origin main

# debug: show which URLs will be used for push/fetch
git remote -v

# --- build & deploy (use same message for gh-pages commit) ---
"${MKDOCS_BIN}" build

# First try deploy as-is. If it fails (common with HTTPS RPC errors), retry after forcing SSH.
if ! "${MKDOCS_BIN}" gh-deploy --force -m "deploy: ${AUTO_MSG}"; then
  echo "gh-deploy failed. Retrying with SSH remote (if available)..."
  ORIGIN_FETCH_URL="$(git remote get-url origin 2>/dev/null || true)"
  ORIGIN_PUSH_URL="$(git remote get-url --push origin 2>/dev/null || true)"
  ORIGIN_URL="${ORIGIN_PUSH_URL:-${ORIGIN_FETCH_URL}}"
  if [[ -n "${ORIGIN_URL}" && "${ORIGIN_URL}" == https://github.com/* ]]; then
    SSH_TEST_OUT="$(ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new -o ConnectTimeout=5 -T git@github.com 2>&1 || true)"
    if echo "${SSH_TEST_OUT}" | grep -Eqi "successfully authenticated|^Hi [^!]+!"; then
      SSH_URL="${ORIGIN_URL/https:\/\/github.com\//git@github.com:}"
      echo "Switching origin to SSH (fetch+push): ${SSH_URL}"
      git remote set-url origin "${SSH_URL}"
      git remote set-url --push origin "${SSH_URL}"
    else
      echo "SSH auth to GitHub not configured; cannot retry via SSH. ssh -T output: ${SSH_TEST_OUT}"
      exit 1
    fi
  fi
  "${MKDOCS_BIN}" gh-deploy --force -m "deploy: ${AUTO_MSG}"
fi

# --- open site ---
SITE_URL="https://ufarobot.github.io/git-cs-book/"
if [[ -f "docs/CNAME" ]]; then
  CNAME_HOST="$(head -n 1 docs/CNAME | tr -d '\r' | xargs)"
  if [[ -n "${CNAME_HOST}" ]]; then
    if [[ "${CNAME_HOST}" == http://* || "${CNAME_HOST}" == https://* ]]; then
      SITE_URL="${CNAME_HOST}"
    else
      SITE_URL="https://${CNAME_HOST}"
    fi
  fi
fi
open "${SITE_URL}"
echo "Done."