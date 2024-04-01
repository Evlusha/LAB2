package main

import (
	"fmt"
)

func isPrime(n int) bool {
	if n <= 1 {
		return false
	}
	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	var numbers []int
	var num int

	// Ввод чисел
	fmt.Println("Введите числа (для завершения введите отрицательное число):")
	fmt.Scan(&num)

	for {
		if num > 0 {
			numbers = append(numbers, num)
			fmt.Scan(&num)
			if num < 0 {
				break
			}
		} else {
			fmt.Println("Нужно вводить только числа:")
			return
		}
	}

	// Проверка чисел на простоту
	fmt.Println("Результаты проверки чисел на простоту:")
	for _, number := range numbers {
		if isPrime(number) {
			fmt.Printf("%d - простое число\n", number)
		} else {
			fmt.Printf("%d - не является простым числом\n", number)
		}
	}
}
