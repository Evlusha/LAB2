morse_alphabet = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."]

char_to_morse = {}
('a'..'z').each_with_index do |c, i|
  char_to_morse[c] = morse_alphabet[i]
end

def generate_permutations(str, l, r, permutations)
  if l == r
    permutations.add(str)
  else
    (l..r).each do |i|
      str[l], str[i] = str[i], str[l]
      generate_permutations(str, l + 1, r, permutations)
      str[l], str[i] = str[i], str[l]
    end
  end
end

def string_to_morse(str, char_to_morse)
  morse_string = ""
  str.each_char do |c|
    morse_string += char_to_morse[c]
  end
  morse_string
end

char_to_morse_map = {}
('a'..'z').each do |c|
  char_to_morse_map[c] = morse_alphabet[c.ord - 'a'.ord]
end

input = ""
print "Введите буквы для перестановки: "
input = gets.chomp

permutations = Set.new
generate_permutations(input, 0, input.size - 1, permutations)

unique_morse_words = Set.new
permutations.each do |word|
  unique_morse_words.add(string_to_morse(word, char_to_morse_map))
end

puts "Уникальные слова в языке Морзе: "
unique_morse_words.each do |morse_word|
  print morse_word + "|| "
end
