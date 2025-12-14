

# String

`String` — класс для работы с текстом (строками символов).

- Строковый литерал пишется в кавычках: `"Hello"`, `"abc123"`.
- Переменная типа `String` ссылается на объект-строку.
- Строки **неизменяемы**: методы не меняют исходную строку, а возвращают новую.

```java
String name = "Alice";
String hello = "Hello, " + name;  // конкатенация строк
```

## Создание строк

**Основные способы**

```java
String s1 = "Hello";          // строковый литерал — основной способ
String s2 = "";               // пустая строка
String s3 = String.valueOf(10); // из числа -> "10"
```

Конструкция `new String("Hello")` в обычном коде не нужна.

## Длина и доступ к символам

**Основные методы**

| Сигнатура              | Описание                         |
|------------------------|----------------------------------|
| `int length()`         | Длина строки (количество символов). |
| `char charAt(int i)`   | Символ по индексу `i` (от 0 до `length() - 1`). |

Пример:

```java
String s = "Java";

int n = s.length();      // 4
char c = s.charAt(1);    // 'a'
```

## Сравнение строк

Строки нельзя сравнивать через `==`, для содержимого используются методы `equals` и `equalsIgnoreCase`.

**Основные методы**

| Сигнатура                           | Описание                               |
|-------------------------------------|----------------------------------------|
| `boolean equals(String other)`      | Истина, если строки одинаковы посимвольно. |
| `boolean equalsIgnoreCase(String other)` | То же, но без учёта регистра.     |

Примеры:

```java
String a = "Hello";
String b = "Hello";
String c = "hello";

boolean x = a.equals(b);            // true
boolean y = a.equals(c);            // false
boolean z = a.equalsIgnoreCase(c);  // true
```

## Конкатенация (склейка) строк

Строки можно соединять оператором `+`. При этом другие типы автоматически превращаются в текст.

```java
int n = 10;
double x = 3.14;

String s = "n = " + n + ", x = " + x;
// "n = 10, x = 3.14"
```

Можно использовать и явное преобразование:

```java
String s1 = String.valueOf(n);
String s2 = Integer.toString(n);
```

## Подстроки

**Основные методы**

| Сигнатура                             | Описание                                      |
|---------------------------------------|-----------------------------------------------|
| `String substring(int beginIndex)`    | Подстрока от `beginIndex` до конца строки.    |
| `String substring(int beginIndex, int endIndex)` | Подстрока от `beginIndex` до `endIndex - 1`. |

Индексы считаются от 0. `endIndex` не входит в подстроку.

Примеры:

```java
String s = "abcdef";

String t1 = s.substring(2);      // "cdef"
String t2 = s.substring(1, 4);   // "bcd"
```

## Поиск в строке

**Основные методы**

| Сигнатура                             | Описание                                         |
|---------------------------------------|--------------------------------------------------|
| `int indexOf(String str)`             | Индекс первого вхождения `str`, либо `-1`, если нет. |
| `int indexOf(char ch)`                | Индекс первого вхождения символа `ch`, либо `-1`.    |
| `boolean contains(CharSequence s)`    | Содержит ли строка подстроку `s`.               |
| `boolean startsWith(String prefix)`   | Начинается ли строка с `prefix`.                |
| `boolean endsWith(String suffix)`     | Заканчивается ли строка на `suffix`.            |

Примеры:

```java
String s = "abracadabra";

int p = s.indexOf("bra");   // 1
int q = s.indexOf('a');     // 0

boolean c1 = s.contains("cad");    // true
boolean c2 = s.startsWith("ab");   // true
boolean c3 = s.endsWith("bra");    // true
```

## Изменение регистра и обрезка пробелов

Эти методы возвращают новые строки, исходная строка не меняется.

**Основные методы**

| Сигнатура                  | Описание                                      |
|----------------------------|-----------------------------------------------|
| `String toLowerCase()`     | Копия строки в нижнем регистре.              |
| `String toUpperCase()`     | Копия строки в верхнем регистре.             |
| `String trim()`            | Копия строки без пробелов по краям.          |

Примеры:

```java
String s = "  Hello ";

String t1 = s.trim();            // "Hello"
String t2 = t1.toLowerCase();    // "hello"
String t3 = t1.toUpperCase();    // "HELLO"
```

## Разбиение строки

Метод `split` разбивает строку на части по разделителю и возвращает массив строк.

| Сигнатура                       | Описание                                   |
|---------------------------------|--------------------------------------------|
| `String[] split(String regex)`  | Делит строку по разделителю `regex`.      |

Пример с простым разделителем (пробел):

```java
String line = "one two three";

String[] parts = line.split(" "); // ["one", "two", "three"]
```

Для более сложных шаблонов `regex` используется регулярное выражение. В базовых задачах часто хватает разделения по пробелу или запятой.

## Примеры использования

**Подсчёт длины строки**

```java
String s = in.nextLine();
int n = s.length();
System.out.println(n);
```

**Проверка, что строка начинается с заданного префикса**

```java
String s = in.nextLine();
String pref = "java";

if (s.startsWith(pref)) {
    System.out.println("YES");
} else {
    System.out.println("NO");
}
```

**Сравнение строк без учёта регистра**

```java
String s1 = in.nextLine();
String s2 = in.nextLine();

if (s1.equalsIgnoreCase(s2)) {
    System.out.println("EQUAL");
} else {
    System.out.println("DIFFERENT");
}
```

## Полный API

Полный список методов и деталей реализации см. в официальной документации Java для класса [`java.lang.String` (Java SE 11)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/String.html).