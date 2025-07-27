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

# --- optional GitHub login via gh ---
if command -v gh >/dev/null 2>&1; then
  if ! gh auth status -h github.com >/dev/null 2>&1; then
    echo "Logging into GitHub via browser..."
    gh auth login --hostname github.com --web --git-protocol https >/dev/null
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

# --- build & deploy (use same message for gh-pages commit) ---
"${MKDOCS_BIN}" build
"${MKDOCS_BIN}" gh-deploy --force -m "deploy: ${AUTO_MSG}"

# --- open site ---
open "https://ufarobot.github.io/git-cs-book/"
echo "Done."