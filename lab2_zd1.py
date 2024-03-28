import random

class StringValidator:
    @staticmethod
    def Mai():
        print("Введите текст")
        text = input()

        i = 0
        while i < len(text) - 2:
            if text[i] == text[i + 1] and text[i + 1] == text[i + 2]:
                text = text[:i + 2] + StringValidator.random_char() + text[i + 3:]
            i += 1

        print(text)

    @staticmethod
    
    def random_char():
        
        chars = "abcdefghijklmnopqrstuvwxyz"
        
        return random.choice(chars)
StringValidator.Mai() 