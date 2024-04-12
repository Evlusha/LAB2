
#include <iostream>
#include <vector>
using namespace std;

bool is_prime(int n)
{
    if (n < 1)
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
    int sh;
    cout << "Введите количество цифр\n";
    cin >> sh;
    // Ввод чисел
    cout << "Введите числа :\n";
   
        for (int i = 0; i < sh; i++)
        {
            cin >> num;
            if (num > 0)
            {
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
