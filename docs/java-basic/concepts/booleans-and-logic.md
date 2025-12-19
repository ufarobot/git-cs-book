# Логические значения и условия

Во многих задачах нужно отвечать на вопросы «да» или «нет»: число чётное или нечётное, попадает ли значение в диапазон, совпадают ли две строки.

=== "Java"

    В Java для таких ответов есть тип `boolean` с двумя значениями: `true` и `false`.

    **Минимум, который нужен в задачах**  
    `boolean` – тип для «да/нет».  
    Сравнения (`==`, `!=`, `<`, `>`, `<=`, `>=`) дают `boolean`.  
    Логические операции: `&&` (И), `||` (ИЛИ), `!` (НЕ).

    **Сравнения**

    ```java
    int a = 5;
    int b = 7;

    boolean r1 = (a == b);   // равно?
    boolean r2 = (a != b);   // не равно?
    boolean r3 = (a < b);    // меньше?
    boolean r4 = (a >= 0);   // не меньше 0?
    ```

    **Логические операции**

    ```java
    int x = 10;

    boolean inRange = (x >= 1) && (x <= 100);  // x в диапазоне 1..100
    boolean isBorder = (x == 1) || (x == 100); // x равен 1 или 100
    boolean notBorder = !isBorder;             // наоборот
    ```

    **Строки сравнивают через equals**

    ```java
    String s1 = "yes";
    String s2 = "yes";

    boolean same = s1.equals(s2); // true
    ```

    **Примеры**

    Чётное или нечётное:

    ```java
    int x = 7;
    boolean isEven = (x % 2 == 0);

    if (isEven) {
        System.out.println("Чётное");
    } else {
        System.out.println("Нечётное");
    }
    ```

    Программа выведет:

    ```text
    Нечётное
    ```

    Проверка диапазона:

    ```java
    int x = 17;

    if (x >= 10 && x <= 20) {
        System.out.println("ДА");
    } else {
        System.out.println("НЕТ");
    }
    ```

    Программа выведет:

    ```text
    ДА
    ```

    Одно из нескольких значений:

    ```java
    int month = 12;
    boolean isWinter = (month == 12) || (month == 1) || (month == 2);

    if (isWinter) {
        System.out.println("Зима");
    } else {
        System.out.println("Не зима");
    }
    ```

    Программа выведет:

    ```text
    Зима
    ```

=== "C++"

    В C++ для таких ответов есть тип `bool` со значениями `true` и `false`.

    **Минимум, который нужен в задачах**  
    `bool` – тип для «да/нет».  
    Сравнения (`==`, `!=`, `<`, `>`, `<=`, `>=`) дают `bool`.  
    Логические операции: `&&`, `||`, `!`.

    **Сравнения**

    ```cpp
    int a = 5;
    int b = 7;

    bool r1 = (a == b);
    bool r2 = (a != b);
    bool r3 = (a < b);
    bool r4 = (a >= 0);
    ```

    **Логические операции**

    ```cpp
    int x = 10;

    bool inRange = (x >= 1) && (x <= 100);
    bool isBorder = (x == 1) || (x == 100);
    bool notBorder = !isBorder;
    ```

    **Строки (`std::string`) можно сравнивать через `==`**

    ```cpp
    #include <string>

    std::string s1 = "yes";
    std::string s2 = "yes";

    bool same = (s1 == s2); // true
    ```

    **Примеры**

    Чётное или нечётное:

    ```cpp
    #include <iostream>

    int main() {
        int x = 7;
        bool isEven = (x % 2 == 0);

        if (isEven) {
            std::cout << "Чётное\n";
        } else {
            std::cout << "Нечётное\n";
        }
        return 0;
    }
    ```

    Программа выведет:

    ```text
    Нечётное
    ```

    Проверка диапазона:

    ```cpp
    #include <iostream>

    int main() {
        int x = 17;

        if (x >= 10 && x <= 20) {
            std::cout << "ДА\n";
        } else {
            std::cout << "НЕТ\n";
        }
        return 0;
    }
    ```

    Программа выведет:

    ```text
    ДА
    ```

    Одно из нескольких значений:

    ```cpp
    #include <iostream>

    int main() {
        int month = 12;
        bool isWinter = (month == 12) || (month == 1) || (month == 2);

        if (isWinter) {
            std::cout << "Зима\n";
        } else {
            std::cout << "Не зима\n";
        }
        return 0;
    }
    ```

    Программа выведет:

    ```text
    Зима
    ```

=== "Python"

    В Python для таких ответов есть тип `bool` со значениями `True` и `False`.

    **Минимум, который нужен в задачах**  
    `bool` – тип для «да/нет».  
    Сравнения (`==`, `!=`, `<`, `>`, `<=`, `>=`) дают `bool`.  
    Логические операции: `and`, `or`, `not`.

    **Сравнения**

    ```python
    a = 5
    b = 7

    r1 = (a == b)
    r2 = (a != b)
    r3 = (a < b)
    r4 = (a >= 0)
    ```

    **Логические операции**

    ```python
    x = 10

    in_range = (x >= 1) and (x <= 100)
    is_border = (x == 1) or (x == 100)
    not_border = not is_border
    ```

    **Строки можно сравнивать через `==`**

    ```python
    s1 = "yes"
    s2 = "yes"

    same = (s1 == s2)  # True
    ```

    **Примеры**

    Чётное или нечётное:

    ```python
    x = 7
    is_even = (x % 2 == 0)

    if is_even:
        print("Чётное")
    else:
        print("Нечётное")
    ```

    Программа выведет:

    ```text
    Нечётное
    ```

    Проверка диапазона:

    ```python
    x = 17

    if 10 <= x <= 20:
        print("ДА")
    else:
        print("НЕТ")
    ```

    Программа выведет:

    ```text
    ДА
    ```

    Одно из нескольких значений:

    ```python
    month = 12
    is_winter = (month == 12) or (month == 1) or (month == 2)

    if is_winter:
        print("Зима")
    else:
        print("Не зима")
    ```

    Программа выведет:

    ```text
    Зима
    ```

=== "Отличия"

    В Java, C++ и Python логика похожа: сравнения дают «да/нет», а из нескольких условий можно собрать одно с помощью И/ИЛИ/НЕ.

    **Как пишутся значения**  
    Java: `true`, `false`.  
    C++: `true`, `false`.  
    Python: `True`, `False` (с заглавной буквы).

    **Что можно ставить в условие**  
    В Java условие в `if` должно быть именно `boolean`. Нельзя написать `if (x)` для числа.  
    В C++ и Python в условии можно использовать не только `bool`: число `0` считается ложью, а любое другое число – истиной. Это удобно, но иногда приводит к ошибкам.

    **Операторы логики**  
    Java, C++: `&&`, `||`, `!`.  
    Python: `and`, `or`, `not`.

    **Сравнение строк**  
    Java: по содержимому – `s1.equals(s2)`.  
    C++ (`std::string`) и Python: по содержимому – `s1 == s2`.

    **Короткое вычисление (short-circuit)**  
    В Java, C++ и Python выражения с И/ИЛИ вычисляются слева направо и часто «останавливаются», когда ответ уже ясен (например, в `A && B`, если `A` ложь, `B` может не вычисляться).