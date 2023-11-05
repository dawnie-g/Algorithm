import Foundation

let word = readLine()!
var arr = [String](repeating: "", count: word.count)

for i in 0..<word.count {
    arr[i] = String(word.suffix(i+1))
}

print(arr.sorted().joined(separator: "\n"))