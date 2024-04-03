import Foundation

func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func main() {
    var numbers = [Int]()
    var num: Int = 0
    
    print("Введите числа (для завершения введите отрицательное число):")
    while true {
        if num >= 0 {
            if let input = readLine(), let inputNum = Int(input) {
                num = inputNum
                if num < 0 {
                    break
                }
                numbers.append(num)
            }
        } else {
            print("Нужно вводить только числа:")
            return
        }
    }
    
    print("Результаты проверки чисел на простоту:")
    for number in numbers {
        if isPrime(number) {
            print("\(number) - простое число")
        } else {
            print("\(number) - не является простым числом")
        }
    }
}

main()
