using System;
using System.Collections.Generic;

class Program
{
    static bool IsPrime(int n)
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

    static void Main()
    {
        List<int> numbers = new List<int>();
        int num;

        Console.WriteLine("Введите числа (для завершения введите отрицательное число):");
        num = int.Parse(Console.ReadLine());

        while (true)
        {
            if (num > 0)
            {
                num = int.Parse(Console.ReadLine());
                if (num < 0)
                {
                    break;
                }
                numbers.Add(num);
            }
            else
            {
                Console.WriteLine("Нужно вводить только числа:");
                return;
            }
        }

        Console.WriteLine("Результаты проверки чисел на простоту:");
        foreach (int number in numbers)
        {
            if (IsPrime(number))
            {
                Console.WriteLine(number + " - простое число");
            }
            else
            {
                Console.WriteLine(number + " - не является простым числом");
            }
        }
    }
}
