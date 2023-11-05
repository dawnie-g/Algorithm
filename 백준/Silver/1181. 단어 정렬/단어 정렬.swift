import Foundation

let n = Int(readLine()!)!
var words = Array(repeating: (0, ""), count: n)
var lastWord = ""
var str = ""

for i in 0..<n {
    let word = readLine()!
    words[i] = (word.count, word)
}
words.sort { ($0.0, $0.1) < ($1.0, $1.1) }

for word in words where lastWord != word.1 {
    str += "\(word.1)\n"
    lastWord = word.1
}
print(str)