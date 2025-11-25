

# StringBuilder (java.lang.StringBuilder) — краткий API

`java.lang.StringBuilder` — класс для «изменяемых строк».

- Позволяет эффективно наращивать текст в циклах и пошагово его изменять.
- В отличие от `String`, содержимое `StringBuilder` можно менять методами `append`, `delete`, `insert` и др.
- Когда текст готов, его обычно превращают в обычную строку методом `toString()`.

```java
StringBuilder sb = new StringBuilder();
sb.append("Hello");
sb.append(" ");
sb.append("world");
String s = sb.toString();     // "Hello world"
```

## Создание StringBuilder

**Основные конструкторы**

```java
StringBuilder sb1 = new StringBuilder();          // пустой буфер
StringBuilder sb2 = new StringBuilder("Hello");   // начальное содержимое
StringBuilder sb3 = new StringBuilder(100);       // начальная ёмкость (для производительности)
```

Обычно достаточно первых двух вариантов.

## Добавление текста: append

Метод `append` добавляет данные в конец.

| Сигнатура                     | Описание                          |
|-------------------------------|-----------------------------------|
| `StringBuilder append(String s)` | Добавляет строку `s`.         |
| `StringBuilder append(char c)`   | Добавляет символ `c`.         |
| `StringBuilder append(int x)`    | Добавляет текстовое представление числа `x`. |

Есть перегрузки для `double`, `boolean` и других типов.  
Все версии `append` возвращают тот же самый объект `StringBuilder`, поэтому можно писать цепочкой.

Примеры:

```java
StringBuilder sb = new StringBuilder();

sb.append("n = ");
sb.append(10);
sb.append(", x = ");
sb.append(3.14);

// "n = 10, x = 3.14"
String s = sb.toString();
```

Цепочка вызовов:

```java
StringBuilder sb = new StringBuilder();
sb.append("n = ").append(10).append(", x = ").append(3.14);
```

## Длина, доступ и изменение символов

**Основные методы**

| Сигнатура                      | Описание                                      |
|--------------------------------|-----------------------------------------------|
| `int length()`                 | Текущая длина текста (количество символов).   |
| `char charAt(int index)`       | Символ по индексу `index` (от 0 до `length()-1`). |
| `void setCharAt(int index, char ch)` | Меняет символ по индексу на `ch`.    |

Пример:

```java
StringBuilder sb = new StringBuilder("Java");

int n = sb.length();         // 4
char c = sb.charAt(1);       // 'a'

sb.setCharAt(0, 'j');        // теперь "java"
```

## Удаление, вставка, разворот

**Основные методы**

| Сигнатура                                     | Описание                                        |
|-----------------------------------------------|-------------------------------------------------|
| `StringBuilder delete(int start, int end)`    | Удаляет символы с `start` до `end-1`.           |
| `StringBuilder deleteCharAt(int index)`       | Удаляет один символ по индексу.                 |
| `StringBuilder insert(int offset, String s)`  | Вставляет строку `s`, начиная с позиции `offset`. |
| `StringBuilder reverse()`                     | Разворачивает весь текст (задом наперёд).       |

Примеры:

```java
StringBuilder sb = new StringBuilder("abcdef");

sb.delete(2, 4);          // удаляем символы с индексами 2 и 3: было "abcdef", стало "abef"
sb.insert(2, "XY");       // "abXYef"
sb.deleteCharAt(1);       // удаляем символ с индексом 1
sb.reverse();             // разворот строки
```

## Преобразование в String

Когда работа с буфером закончена, результат получают так:

```java
StringBuilder sb = new StringBuilder();
sb.append("Hello");
sb.append(" ");
sb.append("world");

String result = sb.toString();   // обычная String
```

Метод `toString()` не меняет содержимое `StringBuilder`.

## Примеры использования

**Сборка строки в цикле**

```java
StringBuilder sb = new StringBuilder();

for (int i = 1; i <= 5; i++) {
    if (i > 1) {
        sb.append(" ");
    }
    sb.append(i);
}

String s = sb.toString();       // "1 2 3 4 5"
System.out.println(s);
```

**Удаление последнего символа, если он есть**

```java
StringBuilder sb = new StringBuilder("abc,");

if (sb.length() > 0 && sb.charAt(sb.length() - 1) == ',') {
    sb.deleteCharAt(sb.length() - 1);
}

String s = sb.toString();       // "abc"
```

## Полный API

Полный список методов и деталей реализации см. в официальной документации Java для класса [`java.lang.StringBuilder` (Java SE 11)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/StringBuilder.html).