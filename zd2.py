import collections

class zd2:
    @staticmethod
    def Main2():
        text = ["qaq", "._. ", "3", "2"]
        uniqueTextCount = zd2.Repac(text, 4)
        print("Количество уникальных слов на азбуке Морзе:", uniqueTextCount)

    @staticmethod
    def Repac(text, size):
        uniqueText = set()
        for i in range(size):
            word = text[i]
            sorted_word = ''.join(sorted(word))
            uniqueText.add(sorted_word)
        return len(uniqueText)

zd2.Main2()
