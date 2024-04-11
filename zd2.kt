import java.util.*

val morseAlphabet = listOf(
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
)

val charToMorse: MutableMap<Char, String> = mutableMapOf()

fun initCharToMorseMap() {
    for (c in 'a'..'z') {
        charToMorse[c] = morseAlphabet[c - 'a']
    }
}

fun generatePermutations(str: String, l: Int, r: Int, permutations: MutableSet<String>) {
    if (l == r) {
        permutations.add(str)
    } else {
        for (i in l..r) {
            val charArray = str.toCharArray()
            charArray[l] = str[i].also { charArray[i] = str[l] }
            generatePermutations(String(charArray), l + 1, r, permutations)
        }
    }
}

fun stringToMorse(str: String): String {
    var morseString = ""
    for (c in str) {
        morseString += charToMorse[c]
    }
    return morseString
}

fun main() {
    initCharToMorseMap()
    val input = readLine() ?: ""
    val permutations = mutableSetOf<String>()
    generatePermutations(input, 0, input.length - 1, permutations)
    val uniqueMorseWords = permutations.map { stringToMorse(it) }.toSet()
    println("Уникальные слова в языке Морзе: ${uniqueMorseWords.joinToString("|| ")}")
}
