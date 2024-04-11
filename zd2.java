import java.util.*;

public class Main {
    static List<String> morseAlphabet = Arrays.asList(
            ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
            ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..");

    static Map<Character, String> charToMorse = new HashMap<>();

    public static void initCharToMorseMap() {
        for (char c = 'a'; c <= 'z'; ++c) {
            charToMorse.put(c, morseAlphabet.get(c - 'a'));
        }
    }

    public static void generatePermutations(String str, int l, int r, Set<String> permutations) {
        if (l == r) {
            permutations.add(str);
        } else {
            for (int i = l; i <= r; i++) {
                str = swapChars(str, l, i);
                generatePermutations(str, l + 1, r, permutations);
                str = swapChars(str, l, i);
            }
        }
    }

    public static String swapChars(String str, int i, int j) {
        char[] charArray = str.toCharArray();
        char temp = charArray[i];
        charArray[i] = charArray[j];
        charArray[j] = temp;
        return new String(charArray);
    }

    public static String stringToMorse(String str) {
        StringBuilder morseString = new StringBuilder();
        for (char c : str.toCharArray()) {
            morseString.append(charToMorse.get(c));
        }
        return morseString.toString();
    }

    public static void main(String[] args) {
        initCharToMorseMap();
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите буквы для перестановки: ");
        String input = scanner.nextLine();
        Set<String> permutations = new HashSet<>();
        generatePermutations(input, 0, input.length() - 1, permutations);
        Set<String> uniqueMorseWords = new HashSet<>();
        for (String word : permutations) {
            uniqueMorseWords.add(stringToMorse(word));
        }
        System.out.print("Уникальные слова в языке Морзе: ");
        for (String morseWord : uniqueMorseWords) {
            System.out.print(morseWord + "|| ");
        }
    }
}
