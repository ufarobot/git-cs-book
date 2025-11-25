

# Scanner (java.util.Scanner) — краткий API

`java.util.Scanner` — класс для чтения данных (чисел, слов, строк) из разных источников: консоль, файл, строка и т.п.

- Чаще всего в задачах используется `Scanner in = new Scanner(System.in);` для чтения из стандартного ввода.
- Методы чтения: `nextInt()`, `nextDouble()`, `next()`, `nextLine()` и др.
- Важно аккуратно работать с `nextLine()` после числовых методов (см. ниже).

## Создание объекта Scanner

Подключение класса:

```java
import java.util.Scanner;
```

Создание для чтения с консоли:

```java
Scanner in = new Scanner(System.in);
```

Другие варианты (для общих сведений):

```java
Scanner inFile = new Scanner(new File("input.txt")); // чтение из файла
Scanner inStr  = new Scanner("10 20 30");            // чтение из строки
```

Для работы с файлами дополнительно нужны `import java.io.File;` и обработка исключений, это выносится в отдельные шаблоны.

## Основные методы чтения

**Числа**

| Сигнатура          | Что читает                    |
|--------------------|-------------------------------|
| `int nextInt()`    | Целое число (`int`).          |
| `long nextLong()`  | Целое число (`long`).         |
| `double nextDouble()` | Число с плавающей точкой. |

Пример:

```java
int a = in.nextInt();
int b = in.nextInt();
double x = in.nextDouble();
```

**Слова и строки**

| Сигнатура          | Что читает                                              |
|--------------------|---------------------------------------------------------|
| `String next()`    | Следующее «слово» (до пробела/перевода строки).        |
| `String nextLine()`| Весь остаток строки до перевода строки (может быть пустым). |

Пример:

```java
String name = in.next();      // читает одно слово
String line = in.nextLine();  // читает всю строку
```

## Важный момент: nextLine() после чисел

После вызова `nextInt()`, `nextDouble()` и других числовых методов в потоке может оставаться перевод строки.  
Если сразу вызвать `nextLine()`, он прочитает именно этот пустой остаток строки.

Типичный приём:

```java
int n = in.nextInt();
in.nextLine();                // читаем конец строки после числа

String line = in.nextLine();  // теперь читаем уже «настоящую» строку
```

## Проверка наличия данных

Методы `hasNext...()` позволяют проверить, есть ли в потоке ещё данные нужного типа:

| Сигнатура              | Что проверяет                             |
|------------------------|-------------------------------------------|
| `boolean hasNext()`    | Есть ли ещё какой-то токен.               |
| `boolean hasNextInt()` | Есть ли целое число (`int`).              |
| `boolean hasNextDouble()` | Есть ли число `double`.              |
| `boolean hasNextLine()`| Есть ли следующая строка.                 |

Пример чтения до конца входа:

```java
while (in.hasNextInt()) {
    int x = in.nextInt();
    // обрабатываем x
}
```

## Примеры использования

**Шаблон для чтения двух чисел и вывода суммы**

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

**Чтение числа, а потом строки**

```java
import java.util.Scanner;

public class NumberAndLineExample {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();
        in.nextLine();                 // убираем перевод строки после числа

        String text = in.nextLine();   // читаем строку целиком

        System.out.println("n = " + n);
        System.out.println("text = " + text);
    }
}
```

## Полный API

Полный список методов и деталей реализации см. в официальной документации Java для класса [`java.util.Scanner` (Java SE 11)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Scanner.html).