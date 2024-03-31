package main

import (
	"fmt"
	"sort"
)

type zd2 struct{}

func (zd2) Main2() {
	text := []string{"aaas", "aaas", "3", "2"}
	uniqueTextCount := Repac(text, 4)
	fmt.Println("Количество уникальных слов на азбуке Морзе:", uniqueTextCount)
}

func Repac(text []string, size int) int {
	uniqueText := make(map[string]struct{})
	for i := 0; i < size; i++ {
		word := text[i]
		wordBytes := []byte(word)
		sort.Slice(wordBytes, func(i, j int) bool {
			return wordBytes[i] < wordBytes[j]
		})
		uniqueText[string(wordBytes)] = struct{}{}
	}
	return len(uniqueText)
}

func main() {
	zd2{}.Main2()
}
