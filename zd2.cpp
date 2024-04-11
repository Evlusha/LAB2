#include <iostream>
#include <algorithm>
#include <vector>
#include <set>
#include <map>
using namespace std;
vector<string> morseAlphabet = {
    ".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---",
    ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."
};

//map который будет хранить соответствие между символами и их представлением в коде Морзе.
map<char,string> charToMorse;
// заполняем map
void initCharToMorseMap() {  
    for (char c = 'a'; c <= 'z'; ++c) {
        charToMorse[c] = morseAlphabet[c - 'a'];
    }
}

//функция генерирует перестановки переданной строки и добавляет их в контейнер
void generatePermutations(string str, int l, int r, set<string>& permutations) { 
    if (l == r) {
        permutations.insert(str);
    }
    else {
        for (int i = l; i <= r; i++) {
            swap(str[l], str[i]);
            generatePermutations(str, l + 1, r, permutations);
            swap(str[l], str[i]);
        }
    }
}

//преобразую строку в код Морзе, используя map
 string stringToMorse(const string& str) { 
    string morseString = "";
    for (char c : str) {
        morseString += charToMorse[c];
    }
    return morseString;
}

int main() {
    initCharToMorseMap();
    setlocale(LC_ALL, "Russian");
    string input;
    cout << "Введите буквы для перестановки: ";
    cin >> input;

    set<string> permutations;
    generatePermutations(input, 0, input.size() - 1, permutations);

    set<string> uniqueMorseWords;
    for (const auto& word : permutations) {
        uniqueMorseWords.insert(stringToMorse(word));
    }

    cout << "Уникальные слова в языке Морзе: ";
    for (const auto& morseWord : uniqueMorseWords) {
        cout << morseWord << "|| ";
    }

    return 0;
}

/*
#include <iostream>
#include <unordered_set>
#include <algorithm>

class zd2 {
public:
    static void Main2() {
        std::string text[] = { "_._ ..", "_._ ..", "3", "2" };
        int uniqueTextCount = Repac(text, 4);
        std::cout << "Количество уникальных слов на азбуке Морзе: " << uniqueTextCount << std::endl;
    }

    static int Repac(std::string text[], int size) {
        std::unordered_set<std::string> uniqueText;
        for (int i = 0; i < size; i++) {
            std::string word = text[i];
            std::sort(word.begin(), word.end());
            uniqueText.insert(word);
        }
        return uniqueText.size();
    }
};

int main() {
    zd2::Main2();
    return 0;
}
*/
