import java.util.*

class Zd2 {
    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            val text = arrayOf("qaq", "._. ._.", "._. ", "2")
            val uniqueTextCount = repac(text, 4)
            println("Количество уникальных слов на азбуке Морзе: $uniqueTextCount")
        }

        fun repac(text: Array<String>, size: Int): Int {
            val uniqueText = HashSet<String>()
            for (i in 0 until size) {
                var word = text[i]
                word = word.toCharArray().sorted().joinToString("")
                uniqueText.add(word)
            }
            return uniqueText.size
        }
    }
}
