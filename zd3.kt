import java.util.*

fun isPrime(n: Int): Boolean {
    if (n <= 1) {
        return false
    }
    var i = 2
    while (i * i <= n) {
        if (n % i == 0) {
            return false
        }
        i++
    }
    return true
}

fun main() {
    val numbers = mutableListOf<Int>()
    val scanner = Scanner(System.`in`)
    var num: Int

    // Ввод чисел
    println("Введите числа (для завершения введите отрицательное число):")
    num = scanner.nextInt()

    while (true) {
        if (num > 0) {
            num = scanner.nextInt()
            if (num < 0) {
                break
            }
            numbers.add(num)
        } else {
            println("Нужно вводить только числа:")
            return
        }
    }

    // Проверка чисел на простоту
    println("Результаты проверки чисел на простоту:")
    for (number in numbers) {
        if (isPrime(number)) {
            println("$number - простое число")
        } else {
            println("$number - не является простым числом")
        }
    }
}
