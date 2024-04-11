use std::collections::{HashMap, HashSet};

const MORSE_ALPHABET: [&str; 26] = [
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.",
    "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
];

fn init_char_to_morse_map() -> HashMap<char, String> {
    let mut char_to_morse: HashMap<char, String> = HashMap::new();
    for (i, c) in ('a'..='z').enumerate() {
        char_to_morse.insert(c, MORSE_ALPHABET[i].to_string());
    }
    char_to_morse
}

fn generate_permutations(str: &mut Vec<char>, l: usize, r: usize, permutations: &mut HashSet<String>) {
    if l == r {
        permutations.insert(str.iter().collect());
    } else {
        for i in l..=r {
            str.swap(l, i);
            generate_permutations(str, l + 1, r, permutations);
            str.swap(l, i);
        }
    }
}

fn string_to_morse(str: &str, char_to_morse: &HashMap<char, String>) -> String {
    str.chars().map(|c| char_to_morse[&c].clone()).collect()
}

fn main() {
    let char_to_morse = init_char_to_morse_map();
    let mut input = String::new();
    println!("Введите буквы для перестановки: ");
    std::io::stdin().read_line(&mut input).expect("Failed to read line");
    let input = input.trim().to_lowercase();

    let mut input_chars: Vec<char> = input.chars().collect();
    let mut permutations: HashSet<String> = HashSet::new();
    generate_permutations(&mut input_chars, 0, input_chars.len() - 1, &mut permutations);

    let mut unique_morse_words: HashSet<String> = HashSet::new();
    for word in permutations.iter() {
        unique_morse_words.insert(string_to_morse(word, &char_to_morse));
    }

    println!("Уникальные слова в языке Морзе: ");
    for morse_word in unique_morse_words.iter() {
        print!("{}|| ", morse_word);
    }
}
