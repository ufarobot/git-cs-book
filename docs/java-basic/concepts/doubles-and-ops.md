# Дробные числа и операции

Дробные числа нужны, когда важна часть после запятой: длина, время, скорость, площадь и т.п.

=== "Java"

    **Тип**

    В Java для дробных значений обычно используют `double`.

    ```java
    double x = 7.5;
    double y = 3.0;
    System.out.println(x + y); // 10.5
    ```

    **Деление**

    Деление `double / double` сохраняет дробную часть.

    ```java
    double a = 7.0;
    double b = 3.0;
    System.out.println(a / b); // 2.3333333333333335
    ```

    Если оба числа целые (`int`), сначала выполняется целочисленное деление.

    ```java
    int a = 7;
    int b = 3;

    System.out.println(a / b);        // 2
    System.out.println(a / 3.0);      // 2.3333333333333335
    System.out.println((double) a / b); // 2.3333333333333335
    ```

    **Смешанные выражения**

    Если в выражении есть и `int`, и `double`, результат становится `double`.

    ```java
    int n = 5;
    double t = 2.5;

    System.out.println(n + t); // 7.5
    System.out.println(n * t); // 12.5
    ```

    **Округление и вывод**

    Для округления часто используют `Math.round`, `Math.floor`, `Math.ceil`.

    ```java
    double x = 3.56;

    System.out.println(Math.round(x)); // 4
    System.out.println(Math.floor(x)); // 3.0
    System.out.println(Math.ceil(x));  // 4.0
    ```

    Для вывода с фиксированным количеством знаков удобно `printf`.

    ```java
    double p = Math.PI;
    System.out.printf("pi = %.2f%n", p);
    System.out.printf("pi = %.4f%n", p);
    ```

    **Примеры**

    Среднее арифметическое:

    ```java
    double a = 10.0;
    double b = 20.0;
    double c = 25.0;

    double avg = (a + b + c) / 3.0;
    System.out.println(avg);
    ```

    Процент от числа:

    ```java
    double value = 250.0;
    double p = 12.0;

    double part = value * p / 100.0;
    System.out.println(part);
    ```


=== "C++"

    **Тип**

    В C++ для дробных значений обычно используют `double`.

    ```cpp
    double x = 7.5;
    double y = 3.0;
    std::cout << (x + y) << "\n"; // 10.5
    ```

    **Деление**

    `double / double` сохраняет дробную часть.

    ```cpp
    double a = 7.0;
    double b = 3.0;
    std::cout << (a / b) << "\n";
    ```

    Если оба числа целые (`int`), деление будет целочисленным.

    ```cpp
    int a = 7;
    int b = 3;

    std::cout << (a / b) << "\n";            // 2
    std::cout << (a / 3.0) << "\n";          // 2.33333...
    std::cout << (static_cast<double>(a) / b) << "\n";
    ```

    **Округление и вывод**

    Округление: `std::round`, `std::floor`, `std::ceil` (заголовок `<cmath>`).

    ```cpp
    double x = 3.56;

    std::cout << std::round(x) << "\n"; // 4
    std::cout << std::floor(x) << "\n"; // 3
    std::cout << std::ceil(x)  << "\n"; // 4
    ```

    Вывод с фиксированным количеством знаков: `std::fixed` и `std::setprecision` (заголовок `<iomanip>`).

    ```cpp
    double p = 3.141592653589793;
    std::cout << std::fixed << std::setprecision(2) << p << "\n"; // 3.14
    std::cout << std::fixed << std::setprecision(4) << p << "\n"; // 3.1416
    ```

    **Примеры**

    Среднее арифметическое:

    ```cpp
    double a = 10.0;
    double b = 20.0;
    double c = 25.0;

    double avg = (a + b + c) / 3.0;
    std::cout << avg << "\n";
    ```

    Перевод градусов в радианы:

    \[
    \text{rad} = \text{deg} \cdot \frac{\pi}{180}
    \]

    ```cpp
    double deg = 60.0;
    double rad = deg * M_PI / 180.0;
    std::cout << rad << "\n";
    ```

    Если `M_PI` недоступен, можно взять `acos(-1.0)`:

    ```cpp
    double pi = std::acos(-1.0);
    ```

=== "Python"

    **Тип**

    В Python дробные числа – это `float`.

    ```python
    x = 7.5
    y = 3.0
    print(x + y)  # 10.5
    ```

    **Деление**

    Оператор `/` всегда даёт дробный результат.

    ```python
    a = 7
    b = 3

    print(a / b)   # 2.3333333333333335
    print(a // b)  # 2
    ```

    **Округление и вывод**

    Округление: `round(x)`.

    ```python
    x = 3.56
    print(round(x))  # 4
    ```

    Вывод с количеством знаков часто делают через форматирование.

    ```python
    import math

    p = math.pi
    print(f"pi = {p:.2f}")
    print(f"pi = {p:.4f}")
    ```

    **Примеры**

    Среднее арифметическое:

    ```python
    a = 10.0
    b = 20.0
    c = 25.0

    avg = (a + b + c) / 3.0
    print(avg)
    ```

    Перевод градусов в радианы:

    \[
    \text{rad} = \text{deg} \cdot \frac{\pi}{180}
    \]

    ```python
    import math

    deg = 60.0
    rad = deg * math.pi / 180.0
    print(rad)
    ```

=== "Отличия"

    **Тип дробных чисел**

    | Язык | Тип | Где часто спотыкаются |
    |------|-----|------------------------|
    | Java | `double` | целочисленное деление `int / int` даёт `int` |
    | C++ | `double` | целочисленное деление `int / int` даёт `int` |
    | Python | `float` | `/` всегда дробное, а `//` – целая часть |

    **Как получить дробный результат при делении целых**

    Java: сделать один операнд `double`.

    ```java
    int a = 7, b = 3;
    System.out.println(a / 3.0);
    System.out.println((double) a / b);
    ```

    C++: сделать один операнд `double`.

    ```cpp
    int a = 7, b = 3;
    std::cout << (a / 3.0) << "\n";
    std::cout << (static_cast<double>(a) / b) << "\n";
    ```

    Python: `/` уже даёт дробный результат.

    ```python
    a = 7
    b = 3
    print(a / b)
    ```

    **Вывод с количеством знаков после запятой**

    Java: `printf("%.2f")`.

    C++: `std::fixed << std::setprecision(2)`.

    Python: `f"{x:.2f}"`.

    Во всех трёх языках `double/float` хранят число приближённо, поэтому сравнение дробных чисел на точное равенство часто даёт неожиданные результаты.