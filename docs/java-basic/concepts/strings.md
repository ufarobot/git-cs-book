# Строки (String)
Строка – это текст: слово, фраза, предложение, любое сообщение, состоящее из символов.

=== "Java"


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

=== "C++"

    В C++ для текста чаще всего используют `std::string`.

    ```cpp
    #include <iostream>
    #include <string>

    int main() {
        std::string name = "Иван";
        std::string city = "Казань";
        std::string message = "Привет, мир!";

        std::cout << message << "\n";
        return 0;
    }
    ```

    `std::string` хранит последовательность символов. Длину можно узнать через `size()` (или `length()`), символ по индексу – через `s[i]`.

    ```cpp
    std::string s = "Java";
    std::size_t n = s.size();   // 4
    char c0 = s[0];             // 'J'
    ```

    Строки можно склеивать через `+` и `+=`:

    ```cpp
    std::string first = "Иван";
    std::string last  = "Петров";
    std::string full  = first + " " + last;
    ```

    Сравнение по содержимому работает через `==`:

    ```cpp
    std::string a = "hello";
    std::string b = "hello";

    bool same = (a == b); // true
    ```

    Подстрока и поиск:

    ```cpp
    std::string s = "abracadabra";

    std::string t = s.substr(3, 4); // "acad"

    std::size_t p = s.find("cad");
    // если не найдено, p == std::string::npos
    ```

    Чтение строки целиком обычно делают через `std::getline`:

    ```cpp
    std::string line;
    std::getline(std::cin, line);
    ```

=== "Python"

    В Python строки имеют тип `str`.

    ```py
    name = "Иван"
    city = "Казань"
    message = "Привет, мир!"

    print(message)
    ```

    Длина строки – `len(s)`, символ по индексу – `s[i]`. Индексация начинается с 0.

    ```py
    s = "Java"
    n = len(s)     # 4
    c0 = s[0]      # 'J'
    ```

    Склейка строк – `+`, а для удобного формата часто используют f-строки:

    ```py
    age = 12
    score = 4.5

    info = f"Возраст: {age}, балл: {score}"
    print(info)
    ```

    Сравнение по содержимому делается через `==`:

    ```py
    a = "hello"
    b = "hello"

    print(a == b)  # True
    ```

    Подстроки обычно берут срезом, а поиск делают через `find`:

    ```py
    s = "abracadabra"

    t = s[3:7]          # "acad"
    p = s.find("cad")   # 4, если нет – -1
    ```

    Разбиение строки по пробелам:

    ```py
    line = "one two three"
    parts = line.split()
    print(parts)  # ['one', 'two', 'three']
    ```

=== "Отличия"

    **Тип строки**

    Java: `String`

    C++: `std::string`

    Python: `str`

    **Сравнение по тексту**

    Java: `s1.equals(s2)` (без учёта регистра: `equalsIgnoreCase`)

    C++: `a == b`

    Python: `a == b`

    **Длина строки**

    Java: `s.length()`

    C++: `s.size()` (или `s.length()`)

    Python: `len(s)`

    **Символ по индексу**

    Java: `s.charAt(i)` возвращает `char`

    C++: `s[i]` возвращает `char`

    Python: `s[i]` возвращает строку длины 1

    **Подстрока**

    Java: `s.substring(l, r)` – правая граница `r` не входит

    C++: `s.substr(l, len)` – второй параметр это длина

    Python: `s[l:r]` – правая граница `r` не входит

    **Склейка строк**

    Java: оператор `+`. Если склеек много, обычно используют `StringBuilder`.

    C++: `+` и `+=`.

    Python: `+`. Если склеек много, обычно собирают части и соединяют через `''.join(parts)`.

    **Чтение строки целиком**

    Java: `Scanner.nextLine()`

    C++: `getline(cin, line)`

    Python: `input()`