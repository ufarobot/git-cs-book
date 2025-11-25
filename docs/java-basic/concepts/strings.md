

# Строки (String)

Строка – это текст: слово, фраза, предложение, любое сообщение, состоящее из символов.  
В Java для работы с текстом используется тип `String`.

```java
String name = "Иван";
String city = "Казань";
String message = "Привет, мир!";
```

Строки удобно использовать для имён, названий, сообщений, вводимых пользователем.

---

## Краткая сводка

Строковая переменная объявляется так:

```java
String имя = "Текст";
```

Примеры:

```java
String hello = "Hello";
String empty = "";              // пустая строка
String digits = "12345";
```

Важно:

- строка записывается в двойных кавычках: `"Java"`;
- тип `String` пишется с большой буквы;
- строка может быть и пустой (`""`).

---

## Создание строк

Основной способ – строковый литерал:

```java
String s1 = "Java";
String s2 = "Строки в Java";
```

Можно собирать строку из чисел и других значений:

```java
int age = 12;
double score = 4.5;

String info = "Возраст: " + age + ", балл: " + score;
// "Возраст: 12, балл: 4.5"
```

Есть и другие способы (через `String.valueOf`, конструкторы и т.п.), но в большинстве задач хватает литералов и конкатенации.

---

## Длина строки и доступ к символам

У строки есть длина – количество символов.  
Нумерация символов начинается с 0.

```java
String s = "Java";

int n = s.length();    // 4
char c0 = s.charAt(0); // 'J'
char c1 = s.charAt(1); // 'a'
```

Полезно помнить:

- последний символ имеет индекс `length() - 1`;
- если обратиться к несуществующему индексу, будет ошибка выполнения.

---

## Конкатенация (склейка) строк

Строки можно склеивать оператором `+`.  
Числа и другие типы при этом автоматически превращаются в текст.

```java
String firstName = "Иван";
String lastName  = "Петров";

String fullName = firstName + " " + lastName;
// "Иван Петров"
```

С числами:

```java
int a = 7;
int b = 3;

String text = "a = " + a + ", b = " + b;
// "a = 7, b = 3"
```

---

## Сравнение строк

Строки нельзя сравнивать по содержимому через `==`.  
Для сравнения текста используются методы `equals` и `equalsIgnoreCase`.

```java
String s1 = "hello";
String s2 = "hello";
String s3 = "Hello";

boolean a = s1.equals(s2);            // true
boolean b = s1.equals(s3);            // false
boolean c = s1.equalsIgnoreCase(s3);  // true
```

`==` проверяет, совпадают ли ссылки (адреса), а не текст.  
Для задач с текстом по содержимому всегда используем `equals`.

---

## Подстроки и поиск

Часть строки можно получить методом `substring`:

```java
String s = "abcdef";

String t1 = s.substring(2);      // "cdef"
String t2 = s.substring(1, 4);   // "bcd"
```

Индексы считаются с 0, правый предел (`endIndex`) не входит.

Поиск подстроки:

```java
String s = "abracadabra";

int p1 = s.indexOf("bra");  // 1
int p2 = s.indexOf("cad");  // 4
int p3 = s.indexOf("xyz");  // -1 (нет вхождения)
```

---

## Разбиение строки

Метод `split` разбивает строку на части по разделителю и возвращает массив строк.

```java
String line = "one two three";

String[] parts = line.split(" ");   // ["one", "two", "three"]
```

Частый случай – разделение по пробелу или запятой.

---

## Чтение строк с клавиатуры

Через `Scanner` строки читают так:

```java
Scanner in = new Scanner(System.in);

String word  = in.next();      // одно слово (до пробела)
String line  = in.nextLine();  // вся строка целиком
```

Если перед `nextLine()` уже читали числа (`nextInt`, `nextDouble` и т.п.), между ними часто нужна «промывка» строки:

```java
int n = in.nextInt();
in.nextLine();                 // читаем остаток строки

String text = in.nextLine();   // теперь читаем настоящую строку
```

---

## Типичные шаблоны

**Подсчёт длины строки**

```java
String s = in.nextLine();
int n = s.length();

System.out.println(n);
```

**Проверка префикса и суффикса**

```java
String s = in.nextLine();

if (s.startsWith("java")) {
    System.out.println("начинается с java");
}

if (s.endsWith(".txt")) {
    System.out.println("это текстовый файл");
}
```

**Сравнение строк без учёта регистра**

```java
String answer = in.nextLine();

if (answer.equalsIgnoreCase("yes")) {
    System.out.println("ДА");
} else {
    System.out.println("НЕТ");
}
```

---

## Что нужно запомнить

Строки в Java хранятся в типе `String` и записываются в двойных кавычках:

```java
String s = "Привет";
```

Длину строки даёт метод `length()`, отдельный символ – `charAt(i)`.

Для сравнения строк по содержимому используется `equals` / `equalsIgnoreCase`, а не оператор `==`.

Строки удобно склеивать оператором `+`, при этом числа автоматически превращаются в текст.