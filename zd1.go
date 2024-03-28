package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	fmt.Println("Введите текст")
	var text string
	fmt.Scanln(&text)

	for i := 0; i < len(text)-2; i++ {
		if text[i] == text[i+1] && text[i+1] == text[i+2] {
			text = text[:i+2] + string(randomChar()) + text[i+3:]
		}
	}

	fmt.Println(text)
}

func randomChar() rune {
	rand.Seed(time.Now().UnixNano())
	chars := []rune("abcdefghijklmnopqrstuvwxyz")
	return chars[rand.Intn(len(chars))]
}
