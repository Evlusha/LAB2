use std::io;

fn is_prime(n: i32) -> bool {
    if n <= 1 {
        return false;
    }
    for i in 2..=(n as f64).sqrt() as i32 {
        if n % i == 0 {
            return false;
        }
    }
    true
}

fn main() {
    let mut numbers: Vec<i32> = Vec::new();
    println!("Введите числа (для завершения введите отрицательное число):");
    
    loop {
        let mut input = String::new();
        io::stdin().read_line(&mut input).expect("Failed to read line");
        let num: i32 = match input.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                eprintln!("Нужно вводить только числа:");
                continue;
            }
        };
        
        if num < 0 {
            break;
        }
        
        numbers.push(num);
    }
    
    println!("Результаты проверки чисел на простоту:");
    for number in numbers {
        if is_prime(number) {
            println!("{} - простое число", number);
        } else {
            println!("{} - не является простым числом", number);
        }
    }
}
