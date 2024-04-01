require 'prime'

def is_prime(n)
  return false if n <= 1
  (2..Math.sqrt(n)).each do |i|
    return false if n % i == 0
  end
  true
end

numbers = []
puts "Введите числа (для завершения введите отрицательное число):"
num = gets.chomp.to_i

while true
  if num > 0
    num = gets.chomp.to_i
    if num < 0
      break
    end
    numbers.push(num)
  else
    puts "Нужно вводить только числа:"
    return 0
  end
end

puts "Результаты проверки чисел на простоту:"
numbers.each do |number|
  if is_prime(number)
    puts "#{number} - простое число"
  else
    puts "#{number} - не является простым числом"
  end
end
