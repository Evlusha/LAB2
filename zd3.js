function isPrime(n) {
  if (n < 1) {
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
  let sh;
  console.log("Введите количество цифр");
  sh = parseInt(prompt());
  
  console.log("Введите числа :");
  for (let i = 0; i < sh; i++) {
    num = parseInt(prompt());
    if (num > 0) {
      numbers.push(num);
    } else {
      console.log("Нужно вводить только числа:");
      return;
    }
  }
  
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
