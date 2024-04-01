import math
import sys
def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            return False
    return True

def main():
    numbers = []
    num = int(input("Введите числа (для завершения введите отрицательное число):\n"))
    

    while True:
        try:
            if isinstance(num, (int, float)):
                if num < 0:
                    break
                numbers.append(num)
                num = int(input())
            else:
                print("Нужно вводить только числа:")
             
        except:
            sys.exit('Error')
    print("Результаты проверки чисел на простоту:")
    for number in numbers:
        if is_prime(number):
            print(f"{number} - простое число")
        else:
            print(f"{number} - не является простым числом")

if __name__ == "__main__":
    main()
