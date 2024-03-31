import Foundation

class Zd2 {
    static func main2() {
        let text = ["qaq", "_._ ..", "3", "2"]
        let uniqueTextCount = repac(text, size: 4)
        print("Количество уникальных слов на азбуке Морзе: \(uniqueTextCount)")
    }
    
    static func repac(_ text: [String], size: Int) -> Int {
        var uniqueText = Set<String>()
        for i in 0..<size {
            var word = text[i]
            word = String(word.sorted())
            uniqueText.insert(word)
        }
        return uniqueText.count
    }
}

Zd2.main2()
