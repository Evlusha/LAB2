import Foundation

var morseAlphabet = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."]

var charToMorse = [Character: String]()

func initCharToMorseMap() {
    for (index, char) in "abcdefghijklmnopqrstuvwxyz".enumerated() {
        charToMorse[char] = morseAlphabet[index]
    }
}

func generatePermutations(str: String, l: Int, r: Int, permutations: inout Set<String>) {
    if l == r {
        permutations.insert(str)
    } else {
        for i in l...r {
            var strArray = Array(str)
            strArray.swapAt(l, i)
            let newStr = String(strArray)
            generatePermutations(str: newStr, l: l + 1, r: r, permutations: &permutations)
        }
    }
}

func stringToMorse(str: String) -> String {
    var morseString = ""
    for char in str {
        if let morseChar = charToMorse[char] {
            morseString += morseChar
        }
    }
    return morseString
}

initCharToMorseMap()

var input = readLine() ?? ""
var permutations = Set<String>()
generatePermutations(str: input, l: 0, r: input.count - 1, permutations: &permutations)

var uniqueMorseWords = Set<String>()
for word in permutations {
    uniqueMorseWords.insert(stringToMorse(str: word))
}

print("Уникальные слова в языке Морзе: ", terminator: "")
for morseWord in uniqueMorseWords {
    print(morseWord, terminator: "|| ")
}
