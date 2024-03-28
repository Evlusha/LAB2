import Foundation

class StringValidator {
    static func main() {
        print("Введите текст")
        if let text = readLine() {
            var modifiedText = text
            for i in 0..<(text.count - 2) {
                let index1 = text.index(text.startIndex, offsetBy: i)
                let index2 = text.index(text.startIndex, offsetBy: i + 1)
                let index3 = text.index(text.startIndex, offsetBy: i + 2)
                
                if text[index1] == text[index2] && text[index2] == text[index3] {
                    modifiedText.remove(at: index3)
                    modifiedText.insert(randomChar(), at: index3)
                }
            }
            print(modifiedText)
        }
    }
    
    static func randomChar() -> Character {
        let chars = Array("abcdefghijklmnopqrstuvwxyz")
        return chars[Int.random(in: 0..<chars.count)]
    }
}

StringValidator.main()
