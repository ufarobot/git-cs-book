

# Ввод и вывод

Почти каждая программа что‑то **получает на вход**, что‑то **вычисляет** и **выводит результат**.  
В консольных программах на Java вход обычно читается с клавиатуры, а вывод появляется в окне консоли.

Для этого чаще всего используются:

- `Scanner` — для ввода;
- `System.out` — для простого вывода в консоль;
- `PrintWriter` — для вывода через отдельный объект (удобен в шаблонах и при записи в файл).

```java
import java.util.Scanner;

public class SumExample {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int a = in.nextInt();
        int b = in.nextInt();

        int sum = a + b;

        System.out.println(sum);
    }
}
```

---

## Краткая сводка

Ввод с клавиатуры:

```java
Scanner in = new Scanner(System.in);

int a = in.nextInt();       // целое число
double x = in.nextDouble(); // число с дробной частью
String s = in.next();       // одно слово (до пробела)
String line = in.nextLine();// вся строка целиком
```

Вывод на экран:

```java
System.out.println("Текст");
System.out.println(123);
System.out.println("x = " + x);
```

`println` выводит значение и переводит строку.  
`print` выводит без перевода строки.  
`printf` позволяет настраивать формат вывода (количество знаков после запятой и т.п.).

---

## Ввод с клавиатуры через Scanner

Чтобы пользоваться `Scanner`, его нужно импортировать и создать объект:

```java
import java.util.Scanner;

Scanner in = new Scanner(System.in);
```

Дальше читаем значения по одному, в том порядке, в котором они заданы во входных данных задачи.

**Чтение чисел**

```java
int n = in.nextInt();          // целое
double price = in.nextDouble();// дробное
```

**Чтение слов и строк**

```java
String word = in.next();       // до пробела
String line = in.nextLine();   // до конца строки
```

После чисел перед `nextLine()` часто нужно убрать остаток строки:

```java
int n = in.nextInt();
in.nextLine();                 // считываем перевод строки

String text = in.nextLine();   // теперь читаем полную строку
```

---

## Вывод на экран: System.out и PrintWriter

`System.out` — готовый объект для вывода в консоль.

```java
System.out.println("Ответ: " + 42);
System.out.print("Введите число: ");
System.out.printf("x = %.2f%n", 3.14159);
```

- `println` — текст + перевод строки;
- `print` — без перевода строки (следующий вывод продолжится в той же строке);
- `printf` — форматированный вывод.

Примеры форматирования:

```java
double x = 3.14159;

System.out.printf("x = %.2f%n", x); // x = 3.14
System.out.printf("x = %.3f%n", x); // x = 3.142
```

`%.2f` — число с 2 знаками после запятой, `%.3f` — с 3.

Иногда вместо прямого использования `System.out` создают объект `PrintWriter` поверх него. Это удобно, когда хочется передавать один объект вывода в методы или легко заменить консоль на файл.

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

        out.close(); // отправляем буфер в консоль и закрываем писатель
    }
}
```

Кратко про разницу:

- `System.out.println(...)` проще, ничего создавать не нужно, этого хватает для большинства учебных программ;
- `PrintWriter out = new PrintWriter(System.out)` даёт отдельный объект вывода, который можно передавать в функции; вывод буферизуется, поэтому в конце обычно вызывают `close()` или `flush()`.

---

## Типичные шаблоны

**Шаблон «прочитать → посчитать → вывести»**

```java
import java.util.Scanner;

public class SumExample {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int a = in.nextInt();
        int b = in.nextInt();

        int sum = a + b;

        System.out.println(sum);
    }
}
```

**Чтение нескольких чисел и вывод результата с поясняющим текстом**

```java
import java.util.Scanner;

public class AverageExample {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        double a = in.nextDouble();
        double b = in.nextDouble();
        double c = in.nextDouble();

        double avg = (a + b + c) / 3.0;

        System.out.println("Среднее: " + avg);
    }
}
```

**Вывод аккуратного дробного результата**

```java
import java.util.Scanner;

public class FormatOutputExample {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        double distance = in.nextDouble();
        double time = in.nextDouble();

        double speed = distance / time;

        System.out.printf("Скорость: %.2f%n", speed);
    }
}
```

---

## Что нужно запомнить

Для ввода с клавиатуры в консольных программах мы используем `Scanner` с `System.in`.  
Для вывода на экран — `System.out.print`, `System.out.println`, при необходимости `System.out.printf`.  
Если нужен отдельный объект вывода (для передачи в методы или записи не только в консоль), можно создать `PrintWriter out = new PrintWriter(System.out)` и печатать через `out.println(...)`.

Порядок ввода в программе должен совпадать с порядком, в котором данные заданы во входе задачи.  
Хороший базовый шаблон: сначала «прочитать», затем «посчитать», затем «вывести результат».