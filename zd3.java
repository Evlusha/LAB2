import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    
    public static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        }
        for (int i = 2; i * i <= n; ++i) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
    
    public static void main(String[] args) {
        ArrayList<Integer> numbers = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);
        int num;
        
         System.out.println("vvedite chislo (dla ostanovki luboe otricatelnoe chislo)");
        
        num = scanner.nextInt();
        
        while (true) {
            if (num > 0) {
                num = scanner.nextInt();
                if (num < 0) {
                    break;
                }
                numbers.add(num);
            } else {
                System.out.println("vvodite tolko chisla");
                return;
            }
        }
        
        
        System.out.println("rezultat");
        for (int number : numbers) {
            if (isPrime(number)) {
                System.out.println(number + " - prostoe");
            } else {
                System.out.println(number + " - not prostoe");
            }
        }
        
        scanner.close();
    }
}
