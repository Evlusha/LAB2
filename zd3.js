function isPrime(n) {
    if (n <= 1) {
        return false;
    }
    for (let i = 2; i * i <= n; ++i) {
        if (n % i === 0) {
            return false;
        }
    }
    return true;
}

function main() {
    const numbers = [];
    let num;
    // Ввод чисел
    console.log("Введите числа (для завершения введите отрицательное число):");
    num = parseInt(prompt("Введите число:"));
    
    while (true) {
        if (num > 0) {
            num = parseInt(prompt("Введите число:"));
            if (num < 0) {
                break;
            }
            numbers.push(num);
        } else {
            console.log("Нужно вводить только числа:");
            return;
        }
    }
    
    // Проверка чисел на простоту
    console.log("Результаты проверки чисел на простоту:");
    for (let number of numbers) {
        if (isPrime(number)) {
            console.log(number + " - простое число");
        } else {
            console.log(number + " - не является простым числом");
        }
    }
}

main();
