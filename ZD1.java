import java.util.Random;
import java.util.Scanner;

public class ZD1 {

public static void main(String[] args) {
Scanner scanner = new Scanner(System.in);
System.out.println("Введите текст");
String text = scanner.nextLine();
scanner.close();

for (int i = 0; i < text.length() - 2; i++) {
if (text.charAt(i) == text.charAt(i + 1) && text.charAt(i + 1) == text.charAt(i + 2)) {
text = text.substring(0, i + 2) + randomChar() + text.substring(i + 3);
}
}

System.out.println(text);
}

public static char randomChar() {
Random random = new Random();
char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
return chars[random.nextInt(chars.length)];
}
}
