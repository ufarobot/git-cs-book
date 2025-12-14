# Стандартный вывод (System.out)

`System.out` — уже созданный объект для вывода текста и чисел в консоль.  

```java
System.out.println("Привет, Java!");
System.out.println(123);
System.out.printf("x = %.2f%n", 3.14159);
```

---

## Основные методы

Самое нужное в учебных задачах:

| Вызов                                   | Что делает                            |
|-----------------------------------------|---------------------------------------|
| `System.out.print(x)`                   | Печатает `x` без перевода строки.     |
| `System.out.println(x)`                 | Печатает `x` и переводит строку.      |
| `System.out.println()`                  | Просто переводит строку.              |
| `System.out.printf(format, args...)`    | Форматированный вывод по шаблону.     |

Есть варианты `print`/`println` для `int`, `double`, `char`, `boolean` и других типов – можно передавать почти любое значение.

Примеры:

```java
int a = 5;
double x = 3.14;

System.out.print("a = ");
System.out.println(a);           // a = 5

System.out.println("x = " + x);  // x = 3.14
```

---

## Форматированный вывод (printf)

`printf` позволяет управлять форматированием числа: количество знаков после запятой, вид целого числа и т.п.  
В отличие от `println`, `printf` сам по себе не добавляет перевод строки (нужно явно указать `%n`).

```java
int n = 7;
double x = 3.14159;

System.out.printf("n = %d%n", n);               // n = 7
System.out.printf("x = %f%n", x);               // x = 3.141590
System.out.printf("x = %.2f%n", x);             // x = 3.14
System.out.printf("n = %d, x = %.3f%n", n, x);  // n = 7, x = 3.142
```

Часто используемые спецификаторы:

| Спецификатор | Значение                                   | Пример                               |
|--------------|--------------------------------------------|--------------------------------------|
| `%d`         | целое число                                | `System.out.printf("%d", 10);`       |
| `%f`         | число с плавающей точкой                   | `System.out.printf("%f", 3.5);`      |
| `%.2f`       | число с 2 знаками после запятой            | `System.out.printf("%.2f", 3.5);`    |
| `%n`         | перевод строки (кроссплатформенный)        | `System.out.printf("Hello%n");`      |

### Автоматическое превращение значений в текст

При конкатенации строк через `+` числа и логические значения автоматически превращаются в текст:

```java
int a = 5;
double x = 3.14;
boolean ok = true;

System.out.println("a = " + a);        // a = 5
System.out.println("x = " + x);        // x = 3.14
System.out.println("ok = " + ok);      // ok = true
```

С `printf` передаём сами значения, а формат (`%d`, `%f` и т.п.) задаёт, как именно они будут преобразованы в текст:

```java
int a = 5;
double x = 3.14;

System.out.printf("a = %d%n", a);      // a = 5
System.out.printf("x = %.1f%n", x);    // x = 3.1
```

---

## Быстрый шаблон sout в IDE

Во многих средах разработки (например, IntelliJ IDEA) есть сокращение `sout`:  
вводишь `sout` и нажимаешь Tab (или другую горячую клавишу) – IDE автоматически подставляет `System.out.println();`.

Это удобно, когда нужно быстро написать несколько строк вывода.

![Шаблон sout в IDE](images/ide-sout.png)

---

## Примеры использования

**Аккуратный вывод дробного результата**

```java
public class SpeedExample {
    public static void main(String[] args) {
        double distance = 150.0; // километров
        double time = 2.0;       // часов

        double speed = distance / time;

        System.out.printf("Скорость: %.2f%n", speed);
    }
}
```

Программа выведет:
```text
Скорость: 75.00
```

**Вывод нескольких значений в одной строке**

```java
public class ManyValuesExample {
    public static void main(String[] args) {
        int n = 5;
        int m = 7;

        System.out.println("n = " + n + ", m = " + m);
    }
}
```

Программа выведет:
```text
n = 5, m = 7
```

**Простая табличка в консоли**

```java
public class TableExample {
    public static void main(String[] args) {
        System.out.println("i  i^2");
        System.out.println("------");

        for (int i = 1; i <= 5; i++) {
            System.out.println(i + "  " + (i * i));
        }
    }
}
```

Программа выведет:
```text
i  i^2
------
1  1
2  4
3  9
4  16
5  25
```

**Вывод результата логического выражения**

```java
public class BooleanExample {
    public static void main(String[] args) {
        int a = 10;
        int b = 3;

        System.out.println("a > b: " + (a > b));
        System.out.println("a % 2 == 0: " + (a % 2 == 0));
    }
}
```

Программа выведет:
```text
a > b: true
a % 2 == 0: true
```

---

## Полный API

- Подробности по всем методам вывода см. в документации [`java.io.PrintStream` (Java SE 11)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/PrintStream.html).