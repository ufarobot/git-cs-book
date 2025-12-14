# File

`File` — класс для работы с путями к файлам и папкам.  
Сам по себе он **не читает и не пишет** данные, а только описывает путь и даёт информацию о файле или каталоге.

Чаще всего `File` используют вместе с `Scanner` и `PrintWriter`:

```java
File input = new File("input.txt");
Scanner in = new Scanner(input);

File output = new File("output.txt");
PrintWriter out = new PrintWriter(output);
```

---

## Кратко

Создание объекта:

```java
File f = new File("data/input.txt");
```

Основные проверки:

```java
f.exists();       // есть ли такой путь
f.isFile();       // это обычный файл?
f.isDirectory();  // это папка?
```

Информация о файле:

```java
f.getName();         // имя (без пути)
f.getPath();         // путь, с которым создавали File
f.getAbsolutePath(); // полный путь
f.length();          // размер в байтах
```

---

## Создание File

Чаще всего достаточно одного конструктора:

```java
File f = new File("data/input.txt");
```

Но есть и другие варианты:

| Конструктор | Пример | Комментарий |
|------------|--------|-------------|
| `File(String path)` | `new File("data/input.txt")` | Относительный или абсолютный путь. |
| `File(String dir, String name)` | `new File("data", "input.txt")` | Папка и имя файла отдельно. |
| `File(File dir, String name)` | `new File(dir, "output.txt")` | На основе другого `File`. |

---

## Основные методы

| Метод | Что делает | Пример |
|-------|------------|--------|
| `exists()` | Проверяет, существует ли файл/папка. | `if (!f.exists()) { ... }` |
| `isFile()` | Проверяет, что это обычный файл. | `if (f.isFile()) { ... }` |
| `isDirectory()` | Проверяет, что это папка. | `if (f.isDirectory()) { ... }` |
| `getName()` | Возвращает имя файла без пути. | `"input.txt"` |
| `getPath()` | Возвращает путь, с которым создавали `File`. | `"data/input.txt"` |
| `getAbsolutePath()` | Возвращает полный путь в файловой системе. | `"/Users/.../data/input.txt"` |
| `length()` | Возвращает размер файла в байтах. | `long size = f.length();` |

---

## Папки

Методы для работы с каталогами:

| Метод | Что делает |
|-------|------------|
| `mkdir()` | Создаёт одну папку (если родительская уже есть). |
| `mkdirs()` | Создаёт цепочку папок при необходимости. |
| `delete()` | Удаляет файл или **пустую** папку. |

Пример подготовки папки для вывода:

```java
File dir = new File("data/results");

if (!dir.exists()) {
    dir.mkdirs();
}

File outFile = new File(dir, "output.txt");
PrintWriter out = new PrintWriter(outFile);
// ...
out.close();
```

---

## Список файлов в папке

Если `File` указывает на папку, можно получить её содержимое:

```java
File dir = new File("data");

if (dir.isDirectory()) {
    File[] files = dir.listFiles();

    if (files != null) {
        for (int i = 0; i < files.length; i++) {
            File f = files[i];
            System.out.println(f.getName());
        }
    }
}
```

`listFiles()` может вернуть `null` при ошибке (например, нет доступа).

---

## Примеры с Scanner и PrintWriter

**Чтение из файла через Scanner**

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class ReadFromFile {
    public static void main(String[] args) throws FileNotFoundException {
        File input = new File("input.txt");
        Scanner in = new Scanner(input);

        while (in.hasNextInt()) {
            int x = in.nextInt();
            System.out.println(x);
        }

        in.close();
    }
}
```

**Запись в файл через PrintWriter**

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class WriteToFile {
    public static void main(String[] args) throws FileNotFoundException {
        File output = new File("output.txt");
        PrintWriter out = new PrintWriter(output);

        out.println("Привет, файл!");
        out.println(123);

        out.close();
    }
}
```

---

Полная документация: Java SE 11, класс `java.io.File` (Oracle Java API).
