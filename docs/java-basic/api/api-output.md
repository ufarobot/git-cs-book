

# Вывод: System.out и PrintWriter — краткий API

В Java для вывода текста и чисел чаще всего используются:

- `System.out` — стандартный поток вывода на консоль (тип `PrintStream`).
- `PrintWriter` — отдельный объект для вывода, который обычно создают поверх `System.out`.


**В чём разница**

- `System.out` уже создан и привязан к консоли, им можно сразу пользоваться, его не закрывают.
- `PrintWriter` нужно создать вручную (часто на основе `System.out` или файла), у него есть `flush()` и `close()`, вывод может буферизоваться.
- В простых программах обычно хватает `System.out.println(...)`.
- `PrintWriter` удобен, когда нужен единый объект вывода (например, для передачи в методы) или когда вывод идёт не в консоль, а в файл/другой поток.


## System.out (PrintStream)

`System.out` — готовый объект для вывода в консоль.

- Используется напрямую: `System.out.println(...)`, без `new`.

**Основные методы**

| Сигнатура                              | Описание                                        |
|----------------------------------------|-------------------------------------------------|
| `void print(String s)`                 | Печатает строку `s` без перевода строки.        |
| `void println(String s)`              | Печатает строку `s` и переводит строку.         |
| `void println()`                      | Просто перевод строки.                          |
| `void printf(String format, Object... args)` | Форматированный вывод по строке `format`. |

Есть перегруженные варианты `print`/`println` для `int`, `double`, `char`, `boolean` и других типов. Можно передать почти любой тип — метод сам преобразует его в текст.

Пример:

```java
int a = 5;
double x = 3.14;

System.out.print("a = ");
System.out.println(a);           // a = 5

System.out.println("x = " + x);  // x = 3.14

System.out.printf("a = %d, x = %.2f%n", a, x);
// a = 5, x = 3.14
```

Здесь `%d` — целое число, `%.2f` — число с плавающей точкой с двумя знаками после запятой, `%n` — перевод строки.

## PrintWriter

`PrintWriter` часто используют как «обёртку» над `System.out`:

```java
PrintWriter out = new PrintWriter(System.out);

out.println("Hello");
out.flush();      // выталкивает буфер в консоль
out.close();      // закрывает писатель (включая flush)
```

Особенности:

- Вывод может буферизоваться — данные не всегда появляются сразу.
- `flush()` принудительно отправляет всё, что накопилось в буфере.
- `close()` автоматически делает `flush()` и закрывает поток.

**Основные методы PrintWriter**

| Сигнатура                              | Описание                                        |
|----------------------------------------|-------------------------------------------------|
| `void print(String s)`                 | Печатает строку `s` без перевода строки.        |
| `void println(String s)`              | Печатает строку `s` и переводит строку.         |
| `void println()`                      | Просто перевод строки.                          |
| `void printf(String format, Object... args)` | Форматированный вывод.                  |
| `void flush()`                         | Принудительно отправляет буфер в выходной поток.|
| `void close()`                         | Закрывает писатель и выполняет `flush()`.       |

У этих методов есть такие же перегрузки по типам, как и у `System.out` (для чисел, логических значений и т.д.).

## Примеры использования

**Простой вывод через System.out**

```java
import java.util.Scanner;

public class SimpleOutputExample {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int a = in.nextInt();
        int b = in.nextInt();

        int sum = a + b;

        System.out.println("Сумма = " + sum);
    }
}
```

**Шаблон с PrintWriter**

```java
import java.io.PrintWriter;
import java.util.Scanner;

public class SumWithPrintWriter {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        PrintWriter out = new PrintWriter(System.out);

        int a = in.nextInt();
        int b = in.nextInt();

        int sum = a + b;

        out.println(sum);

        out.close();
    }
}
```

В этом шаблоне вывод идёт через `out.println(...)`, а в конце `out.close()` гарантирует, что весь текст действительно окажется в консоли.

**Форматированный вывод**

```java
import java.io.PrintWriter;

public class FormatExample {
    public static void main(String[] args) {
        PrintWriter out = new PrintWriter(System.out);

        int n = 7;
        double x = 3.14159;

        out.printf("n = %d, x = %.3f%n", n, x);

        out.close();
    }
}
```

## Замечания

- В одной программе лучше не смешивать вывод через `System.out.println(...)` и через `PrintWriter out = new PrintWriter(System.out)` одновременно — выбрать один подход и придерживаться его.
- При использовании `PrintWriter` важно в конце вызвать `flush()` или `close()`, иначе часть вывода может остаться в буфере.
- Форматированный вывод (`printf`) удобно использовать, когда нужно строго контролировать формат текста и количество знаков после запятой.

## Полный API

Подробные описания всех методов см. в официальной документации:

- [`java.io.PrintStream` (Java SE 11)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/PrintStream.html)
- [`java.io.PrintWriter` (Java SE 11)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/PrintWriter.html)