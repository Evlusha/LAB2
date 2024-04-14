use std::collections::{HashMap, HashSet};
use std::io::{self, Write};

fn main() {
    // КОМПИЛИРОВАТЬ ТУТ !!! https://www.mycompiler.io/new/rust
    // Создаем словарь, сопоставляющий буквы алфавита с их представлением в коде Морзе
    let morse_alphabet: HashMap<char, &'static str> = [
        ('a', ".-"), ('b', "-..."), ('c', "-.-."), ('d', "-.."), ('e', "."), ('f', "..-."), ('g', "--."),
        ('h', "...."), ('i', ".."), ('j', ".---"), ('k', "-.-"), ('l', ".-.."), ('m', "--"), ('n', "-."),
        ('o', "---"), ('p', ".--."), ('q', "--.-"), ('r', ".-."), ('s', "..."), ('t', "-"), ('u', "..-"),
        ('v', "...-"), ('w', ".--"), ('x', "-..-"), ('y', "-.--"), ('z', "--.."),
    ].iter().cloned().collect();

    // Получаем ввод от пользователя
    println!("Введите слова через пробел: ");
    io::stdout().flush().unwrap();
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Ошибка при чтении ввода");

    // Убираем лишние символы и преобразуем к нижнему регистру
    let input = input.trim().to_lowercase();

    // Разбиваем строку на слова
    let words: Vec<&str> = input.split_whitespace().collect();

    // Создаем множество для хранения уникальных слов на азбуке Морзе
    let mut unique_morse_words = HashSet::new();

    // Перебираем слова и преобразуем их в код Морзе, добавляем в множество
    for word in words {
        let morse_word = word.chars()
            .map(|c| morse_alphabet[&c])
            .collect::<Vec<&str>>()
            .join("");
        unique_morse_words.insert(morse_word);
    }

    // Выводим уникальные слова на азбуке Морзе
    println!("Уникальные слова на азбуке Морзе: ");
    for morse_word in unique_morse_words.iter() {
        println!("{}", morse_word);
    }
}
