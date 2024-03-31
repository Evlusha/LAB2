use std::collections::HashSet;

fn main() {
    Main2();
}

fn Main2() {
    let text = ["_._ ..", "_._ ..", "2", "_._ .."];
    let unique_text_count = repac(&text);
    println!("Количество уникальных слов на азбуке Морзе: {}", unique_text_count);
}

fn repac(text: &[&str]) -> usize {
    let mut unique_text: HashSet<String> = HashSet::new();
    for word in text {
        let mut sorted_word = word.chars().filter(|c| c.is_alphabetic()).collect::<String>();
        sorted_word.make_ascii_lowercase();
        let mut sorted_chars: Vec<char> = sorted_word.chars().collect();
        sorted_chars.sort();
        let sorted_word = sorted_chars.iter().collect();
        unique_text.insert(sorted_word);
    }
    unique_text.len()
}
