use std::collections::{HashMap, HashSet};
use std::io::{self, Write};
//https://www.mycompiler.io/new/rust 
fn main() {
    // Создаю словарь
    let morse_alphabet: HashMap<char, &'static str> = [
        ('a', ".-"), ('b', "-..."), ('c', "-.-."), ('d', "-.."), ('e', "."), ('f', "..-."), ('g', "--."),
        ('h', "...."), ('i', ".."), ('j', ".---"), ('k', "-.-"), ('l', ".-.."), ('m', "--"), ('n', "-."),
        ('o', "---"), ('p', ".--."), ('q', "--.-"), ('r', ".-."), ('s', "..."), ('t', "-"), ('u', "..-"),
        ('v', "...-"), ('w', ".--"), ('x', "-..-"), ('y', "-.--"), ('z', "--.."),
    ].iter().cloned().collect();

    // Получаю ввод 
    println!("Введите слова через пробел: ");
    io::stdout().flush().unwrap();
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Ошибка при чтении ввода");

    // Убираю лишние символы и преобразуем к нижнему регистру
    let input = input.trim().to_lowercase();

    // Разбиваем строку на слова
    let words: Vec<&str> = input.split_whitespace().collect();

    // Создаю множество для хранения уникальных слов на азбуке Морзе
    let mut unique_morse_words = HashSet::new();

    // Перебираю слова и генерируем все возможные перестановки букв, преобразуем их в код Морзе и добавляем в множество
    for word in words {
        let mut permuted_word = word.chars().collect::<Vec<char>>();
        permuted_word.sort_unstable(); // Сортируем буквы, чтобы получить все возможные перестановки
        permuted_word.dedup(); // Удаляем дубликаты, чтобы избежать повторений
        generate_permutations(&mut permuted_word, 0, &mut String::new(), &mut unique_morse_words, &morse_alphabet);
    }

    // Выводим уникальные слова на азбуке Морзе
    println!("Уникальные слова на азбуке Морзе: ");
    for morse_word in unique_morse_words.iter() {
        println!("{}", morse_word);
    }
}

// Функция для генерации всех возможных перестановок букв и преобразования их в код Морзе
fn generate_permutations(word: &mut Vec<char>, index: usize, current: &mut String, unique_morse_words: &mut HashSet<String>, morse_alphabet: &HashMap<char, &'static str>) {
    if index == word.len() {
        let morse_word = word.iter().map(|&c| morse_alphabet[&c]).collect::<String>();
        unique_morse_words.insert(morse_word);
        return;
    }

    for i in index..word.len() {
        word.swap(index, i);
        current.push(word[index]);
        generate_permutations(word, index + 1, current, unique_morse_words, morse_alphabet);
        current.pop();
        word.swap(index, i);
    }
}
