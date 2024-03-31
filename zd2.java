
import java.util.HashSet;
import java.util.Arrays;

public class zd2 {
    public static void main(String[] args) {
        String[] text = { "qaq", "qaq", "3", "2" };
        int uniqueTextCount = Repac(text, 4);
        System.out.println("Количество уникальных слов на азбуке Морзе: " + uniqueTextCount);
    }

    public static int Repac(String[] text, int size) {
        HashSet<String> uniqueText = new HashSet<>();
        for (int i = 0; i < size; i++) {
            String word = text[i];
            char[] wordChars = word.toCharArray();
            Arrays.sort(wordChars);
            String sortedWord = new String(wordChars);
            uniqueText.add(sortedWord);
        }
        return uniqueText.size();
    }
}
