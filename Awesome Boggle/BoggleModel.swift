
import Foundation

class BoggleModel {
    var wordArray: [String] = []
    
    func randomLetter() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let rand = Int(arc4random_uniform(26))
        let stringArray = Array(letters.characters)
        return String(stringArray[rand])
    }
    
    func lettersArray(numberOfLetters: Int) -> [String] {
        var array = [String]()
        for number in 0..<numberOfLetters {
            array.append(randomLetter())
        }
        return array
    }
    
    func addWord(word: String) -> [String] {
        wordArray.append(word)
        return wordArray
    }
    
    func resetAllTheWords() {
        wordArray = []
    }
}
