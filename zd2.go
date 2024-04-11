package main

import (
	"fmt"
	"sort"
)

var morseAlphabet = []string{
	".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
	".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..",
}

var charToMorse map[rune]string

func initCharToMorseMap() {
	charToMorse = make(map[rune]string)
	for i, c := 'a', 0; i <= 'z'; i, c = i+1, c+1 {
		charToMorse[i] = morseAlphabet[c]
	}
}

func generatePermutations(str []rune, l, r int, permutations *map[string]struct{}) {
	if l == r {
		(*permutations)[string(str)] = struct{}{}
	} else {
		for i := l; i <= r; i++ {
			str[l], str[i] = str[i], str[l]
			generatePermutations(str, l+1, r, permutations)
			str[l], str[i] = str[i], str[l]
		}
	}
}

func stringToMorse(str string) string {
	morseString := ""
	for _, c := range str {
		morseString += charToMorse[c]
	}
	return morseString
}

func main() {
	initCharToMorseMap()
	var input string
	fmt.Print("Введите буквы для перестановки: ")
	fmt.Scan(&input)

	permutations := make(map[string]struct{})
	generatePermutations([]rune(input), 0, len(input)-1, &permutations)

	uniqueMorseWords := make(map[string]struct{})
	for word := range permutations {
		uniqueMorseWords[stringToMorse(word)] = struct{}{}
	}

	var keys []string
	for k := range uniqueMorseWords {
		keys = append(keys, k)
	}
	sort.Strings(keys)

	fmt.Print("Уникальные слова в языке Морзе: ")
	for _, morseWord := range keys {
		fmt.Print(morseWord, "|| ")
	}
}
