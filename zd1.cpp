#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>
using namespace std;
   
namespace LAB2 {
    class StringValidator {
    public:
        static void Mai() {
            setlocale(LC_ALL, "Russian");
            cout << "Введите текст" << endl;
            string text;
            getline(cin, text);
                        //Он сканирует строку `text` и заменяет любую последовательность из трех одинаковых символов случайным символом.
            for (int i = 0; i < text.length() - 2; i++) {
                if (text[i] == text[i + 1] && text[i + 1] == text[i + 2]) {
                //    text.erase(i + 2, 1);
                    text.insert(i + 2, 1, RandomChar()); 
                }
            }

            cout << text << endl;
        }

    private:
        static char RandomChar() {
            static const char chars[] = "abcdefghijklmnopqrstuvwxyz";
            int charIdx = rand() % 26;
            return chars[charIdx];
        }
    };
}

int main() {
    srand(static_cast<unsigned>(time(nullptr)));
    LAB2::StringValidator::Mai();

    return 0;
}
