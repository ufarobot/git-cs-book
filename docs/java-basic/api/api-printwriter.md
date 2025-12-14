# PrintWriter

`PrintWriter` — класс для удобной записи текста в файл и другие потоки вывода.  
Позволяет печатать строки, числа и логические значения.

---

## Минимум, который нужен в задачах

Чаще всего используется:

- создание `PrintWriter` по имени файла или объекту `File`;
- методы `print`, `println`, `printf` для вывода;
- `close()` в конце работы, чтобы данные точно записались в файл.

---

## Создание PrintWriter

| Сигнатура                         | Что делает                                   |
|-----------------------------------|----------------------------------------------|
| `PrintWriter(String fileName)`    | Открывает файл с именем `fileName` для записи. |
| `PrintWriter(File file)`          | Открывает файл, описанный объектом `File`.   |
| `PrintWriter(OutputStream out)`   | Пишет в уже существующий поток вывода.       |

Обычно в задачах используют первый или второй вариант.

---

## Основные методы вывода

| Метод                                | Что делает                                              |
|--------------------------------------|---------------------------------------------------------|
| `print(x)`                           | Печатает `x` без перевода строки.                       |
| `println(x)`                         | Печатает `x` и переводит строку.                        |
| `println()`                          | Просто перевод строки.                                  |
| `printf(String format, Object... args)` | Форматированный вывод по строке `format`.           |
| `flush()`                            | Принудительно записывает буфер в файл.                  |
| `close()`                            | Закрывает поток; нужно вызывать в конце программы.      |

Есть варианты `print`/`println` для `int`, `double`, `char`, `boolean` и других типов – можно передавать почти любое значение.

---

## Примеры использования

**Запись нескольких строк в файл**

```java
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class WriteLinesExample {
    public static void main(String[] args) throws FileNotFoundException {
        PrintWriter out = new PrintWriter("output.txt");

        out.println("Привет, файл!");
        out.println(123);
        out.println("Конец.");

        out.close();
    }
}
```

Программа выведет в файл `output.txt`:
```text
Привет, файл!
123
Конец.
```

**Вывод чисел от 1 до 5 в файл**

```java
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class NumbersExample {
    public static void main(String[] args) throws FileNotFoundException {
        PrintWriter out = new PrintWriter("numbers.txt");

        for (int i = 1; i <= 5; i++) {
            out.println(i);
        }

        out.close();
    }
}
```

Программа выведет в файл `numbers.txt`:
```text
1
2
3
4
5
```

**Форматированный вывод в файл**

```java
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class FormatExample {
    public static void main(String[] args) throws FileNotFoundException {
        PrintWriter out = new PrintWriter("results.txt");

        int n = 7;
        double x = 3.14159;

        out.printf("n = %d%n", n);
        out.printf("x = %f%n", x);
        out.printf("x = %.2f%n", x);

        out.close();
    }
}
```

Программа выведет в файл `results.txt`:
```text
n = 7
x = 3.141590
x = 3.14
```

---

## Полный API

Подробности по всем конструкторам и методам см. в официальной документации:

- [`java.io.PrintWriter` (Java SE 11)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/PrintWriter.html)
