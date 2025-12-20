# Символы
Иногда нам нужно хранить не целую строку, а один знак: цифру `'7'`, знак `'+'`, первую букву имени.  

=== "Java"

    Для этого в Java есть тип `char` — отдельный символ.

    ```java
    char letter = 'A';
    char digit  = '7';
    char sign   = '+';
    ```

    ---

    ## Краткая сводка

    Символьная переменная объявляется так:

    ```java
    char c = 'A';
    ```

    Примеры:

    ```java
    char letter = 'J';
    char digit  = '3';
    char space  = ' ';   // пробел
    ```

    Важные моменты:

    - символ пишется в одинарных кавычках: `'A'`;
    - строка (`String`) — в двойных: `"A"`, `"Hello"`;
    - тип `char` хранит ровно один символ.

    ---

    ## char и String: в чём разница

    `char` — один символ.  
    `String` — последовательность символов (слово, фраза, текст).

    ```java
    char c = 'A';          // один символ
    String s = "A";        // строка длины 1
    String t = "Java";     // строка длины 4
    ```

    Из строки можно взять символ по индексу:

    ```java
    String s = "Hello";

    char first = s.charAt(0);   // 'H'
    char second = s.charAt(1);  // 'e'
    ```

    ---

    ## Чтение символа с клавиатуры

    В `Scanner` нет метода `nextChar()`, поэтому обычно читают строку и берут первый символ.

    ```java
    import java.util.Scanner;

    public class ReadCharExample {
        public static void main(String[] args) {
            Scanner in = new Scanner(System.in);

            String s = in.next();     // читаем слово
            char c = s.charAt(0);     // берём первый символ

            System.out.println("Символ: " + c);
        }
    }
    ```

    Если нужно прочитать символ из целой строки:

    ```java
    String line = in.nextLine();   // читаем всю строку
    char first = line.charAt(0);   // первый символ
    ```

    ---

    ## Сравнение символов

    Символы можно сравнивать так же, как числа: `==`, `!=`, `<`, `>` и т.п.

    ```java
    char c = 'A';

    boolean isA   = (c == 'A');
    boolean isNot = (c != 'A');
    ```

    Можно проверять, что символ — цифра или буква, с помощью класса `Character`:

    ```java
    char c = in.next().charAt(0);

    boolean isDigit  = Character.isDigit(c);
    boolean isLetter = Character.isLetter(c);
    boolean isSpace  = Character.isWhitespace(c);
    ```

    ---

    ## Код символа и простые шифры

    Внутри компьютер хранит символ как число (код).  
    Можно преобразовать `char` в `int`:

    ```java
    char c = 'A';
    int code = c;           // код символа
    System.out.println(code);
    ```

    Буквы латинского алфавита идут подряд по кодам.  
    Это позволяет делать простые сдвиги по алфавиту (идея шифра Цезаря):

    ```java
    char c = 'A';
    char d = (char)(c + 1);   // 'B'
    ```

    Важно: такие приёмы работают корректно для простых латинских букв без «дырок» в таблице. Для реальных систем шифрования используются другие методы, но для учебных задач этой идеи достаточно.

    ---

    ## Типичные шаблоны

    **Определение типа символа**

    ```java
    char c = in.next().charAt(0);

    if (Character.isDigit(c)) {
        System.out.println("Цифра");
    } else if (Character.isLetter(c)) {
        System.out.println("Буква");
    } else {
        System.out.println("Другой символ");
    }
    ```

    **Проверка, что символ — пробел**

    ```java
    char c = in.next().charAt(0);

    if (Character.isWhitespace(c)) {
        System.out.println("Пробельный символ");
    }
    ```

    ---

    ## Что нужно запомнить

    Тип `char` хранит один символ и записывается в одинарных кавычках:

    ```java
    char c = 'A';
    ```

    Чтобы прочитать символ через `Scanner`, обычно читают строку и берут `charAt(0)`.

    Символы можно сравнивать (`==`, `!=`) и при необходимости получать их числовой код, приводя к `int`.

=== "C++"

    В C++ один символ хранится в типе `char`.

    **Минимум, который нужен в задачах**

    ```cpp
    char letter = 'A';
    char digit  = '7';
    char sign   = '+';
    ```

    Один символ пишется в одинарных кавычках: `'A'`.

    **char и строка (std::string)**

    ```cpp
    char c = 'A';
    std::string s = "A";
    std::string t = "Hello";
    ```

    **Чтение символа**

    ```cpp
    char c;
    std::cin >> c; // читает один символ, пропуская пробелы и переводы строк
    ```

    Если нужно прочитать пробел или перевод строки, удобно использовать `std::cin.get(c)`.

    **Сравнение символов**

    ```cpp
    char c = 'A';
    bool isA = (c == 'A');
    bool isDigit = (c >= '0' && c <= '9');
    ```

    Для проверок «цифра/буква/пробел» можно использовать функции из `<cctype>`:

    ```cpp
    #include <cctype>

    bool d = std::isdigit(static_cast<unsigned char>(c));
    bool a = std::isalpha(static_cast<unsigned char>(c));
    bool w = std::isspace(static_cast<unsigned char>(c));
    ```

    **Код символа**

    ```cpp
    char c = 'A';
    int code = static_cast<unsigned char>(c);
    std::cout << code << "\n";
    ```

=== "Python"

    В Python отдельного типа `char` нет. Один символ — это строка длины 1.

    **Минимум, который нужен в задачах**

    ```python
    letter = 'A'
    digit = '7'
    sign = '+'
    ```

    Один символ обычно пишут в одинарных кавычках: `'A'` (можно и в двойных — это тоже строка).

    **Получить символ из строки**

    ```python
    s = "Hello"
    first = s[0]   # 'H'
    second = s[1]  # 'e'
    ```

    **Чтение символа**

    ```python
    s = input()   # читаем строку
    c = s[0]      # берём первый символ
    ```

    **Проверки символа**

    ```python
    c = '7'
    is_digit = c.isdigit()
    is_alpha = c.isalpha()
    is_space = c.isspace()
    ```

    **Код символа и обратно**

    ```python
    c = 'A'
    code = ord(c)
    print(code)

    d = chr(code + 1)
    print(d)
    ```

=== "Отличия"

    **Java**
    `char` хранит один элемент UTF-16 (16 бит). Обычно это один видимый символ, но некоторые символы (например, часть эмодзи) могут занимать два элемента.

    **C++**
    `char` — это 1 байт. Какой именно символ хранится в этом байте, зависит от кодировки. Для обычных латинских букв и цифр чаще всего всё ведёт себя ожидаемо.

    **Python**
    Отдельного типа `char` нет: один символ — это строка (`str`) длины 1.

    **Сравнение**
    В Java и C++ сравнивают `char`, в Python — строки длины 1. Сравнение идёт по коду символа.

    **Код символа**
    Java: `int code = c;`
    C++: `int code = (unsigned char)c;`
    Python: `ord(c)`

    **Прочитать один символ**
    Java: `in.next().charAt(0)` (читается слово, пробелы пропускаются)
    C++: `std::cin >> c` (пробелы пропускаются), для пробела — `std::cin.get(c)`
    Python: `s = input(); c = s[0]`