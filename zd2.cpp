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
