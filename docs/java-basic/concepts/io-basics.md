# Ввод и вывод

Почти каждая программа что‑то **получает на вход**, что‑то **вычисляет** и **выводит результат**.  

=== "Java"


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

=== "C++"

    В консольных программах на C++ обычно используют `std::cin` для ввода и `std::cout` для вывода.

    **Краткая сводка**

    Ввод и вывод чисел:

    ```cpp
    #include <iostream>

    int main() {
        int a, b;
        std::cin >> a >> b;
        std::cout << (a + b) << '\n';
        return 0;
    }
    ```

    Чтение слова и всей строки:

    ```cpp
    #include <iostream>
    #include <string>

    int main() {
        std::string word;
        std::string line;

        std::cin >> word;              // до пробела
        std::cin.ignore(1000000, '\n');
        std::getline(std::cin, line);  // до конца строки

        std::cout << word << '\n';
        std::cout << line << '\n';
        return 0;
    }
    ```

    **Выводим результат**

    - `<< '\n'` — перевод строки;
    - `std::endl` тоже переводит строку, но дополнительно «сбрасывает» вывод, чаще достаточно `\n`.

    **Форматированный вывод дробных чисел**

    ```cpp
    #include <iostream>
    #include <iomanip>

    int main() {
        double x = 3.14159;
        std::cout << std::fixed << std::setprecision(2) << x << '\n';
        return 0;
    }
    ```

    Программа выведет:

    ```text
    3.14
    ```

    **Быстрый ввод-вывод (иногда полезно в задачах)**

    ```cpp
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);
    ```

=== "Python"

    В консольных программах на Python ввод обычно делается через `input()`, а вывод — через `print()`.

    **Краткая сводка**

    Прочитать одно число:

    ```python
    n = int(input())
    print(n)
    ```

    Прочитать несколько чисел из одной строки:

    ```python
    a, b = map(int, input().split())
    print(a + b)
    ```

    Программа выведет (если на входе `2 5`):

    ```text
    7
    ```

    Прочитать строку целиком:

    ```python
    line = input()
    print(line)
    ```

    **Форматированный вывод дробных чисел**

    ```python
    x = 3.14159
    print(f"{x:.2f}")
    ```

    Программа выведет:

    ```text
    3.14
    ```

    **Если нужно читать много строк**

    ```python
    import sys

    line = sys.stdin.readline().rstrip("\n")
    ```

=== "Отличия"

    **Базовые инструменты**  
    Java: `Scanner` + `System.out`  
    C++: `std::cin` + `std::cout`  
    Python: `input()` + `print()`

    **Перевод строки**  
    Java: `println(...)`, в `printf` – `%n`  
    C++: `\n` (обычно предпочтительнее, чем `std::endl`)  
    Python: `print()` сам добавляет перевод строки

    **Слово и строка целиком**  
    Java: `next()` – одно слово, `nextLine()` – вся строка  
    C++: `cin >> word` – одно слово, `getline(cin, line)` – вся строка  
    Python: `input()` – вся строка, слова – через `split()`

    **После чтения числа нужно прочитать строку**  
    Java: после `nextInt()` часто делают `in.nextLine()`  
    C++: перед `getline(...)` часто делают `cin.ignore(...)`  
    Python: обычно ничего дополнительно делать не нужно

    **Форматирование дробных чисел**  
    Java: `System.out.printf("%.2f%n", x)`  
    C++: `cout << fixed << setprecision(2) << x << '\n'`  
    Python: `print(f"{x:.2f}")`

    **Если данных очень много**  
    C++: `ios::sync_with_stdio(false); cin.tie(nullptr);`  
    Python: `sys.stdin.readline()`  
    Java: чаще всего достаточно `Scanner` и `System.out`