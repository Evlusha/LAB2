import java.util.Random

fun main() {
    
    var text = "qqqwwweeerrtsxcgfdfff"
    for (i in 0 until text!!.length - 2) {
        if (text[i] == text[i + 1] && text[i + 1] == text[i + 2]) {
            text = text.substring(0, i + 2) + randomChar() + text.substring(i + 3)
        }
    }
    println(text)
}

fun randomChar(): Char {
    val random = Random()
    val chars = "abcdefghijklmnopqrstuvwxyz".toCharArray()
    return chars[random.nextInt(chars.size)]
}
