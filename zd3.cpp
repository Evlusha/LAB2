
#include <iostream>
#include <vector>
using namespace std;

    bool is_prime(int n)
    {
        if (n <= 1)
        {
            return false;
        }
        for (int i = 2; i * i <= n; ++i)
        {
            if (n % i == 0)
            {
                return false;
            }
        }
        return true;
    }

    int main() {
        setlocale(LC_ALL, "Russian");
        vector<int> numbers;
        int num;

        // Ввод чисел
        cout << "Введите числа (для завершения введите отрицательное число):\n";
       cin >> num;  
         
        while (true)
        {
            if (num > 0)
            {
                cin >> num;
                if (num < 0)
                {
                   break;
                }
                numbers.push_back(num);
             }
            else 
            {
               cout << "Нужно вводить только числа:\n";

               return 0;
            }
        }      

        // Проверка чисел на простоту
        cout << "Результаты проверки чисел на простоту:\n";
        for (int number : numbers)
        {
            if (is_prime(number))
            {
                cout << number << " - простое число\n";
            }
            else
            {
                cout << number << " - не является простым числом\n";
            }
        }

       
    } 
