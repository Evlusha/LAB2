import itertools

morseAlphabet = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
                  ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."]

charToMorse = {chr(ord('a') + i): morseAlphabet[i] for i in range(26)}

def generatePermutations(input_str):
    permutations = set(''.join(p) for p in itertools.permutations(input_str))
    return permutations

def stringToMorse(input_str):
    morse_string = ''.join(charToMorse[c] for c in input_str)
    return morse_string

input_str = input("Введите буквы для перестановки: ")
permutations = generatePermutations(input_str)
unique_morse_words = {stringToMorse(word) for word in permutations}

print("Уникальные слова в языке Морзе:", "||".join(unique_morse_words))
