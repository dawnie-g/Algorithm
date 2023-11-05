import Foundation

let word = readLine()!
let len = word.count
var arr = [String](repeating: "", count: len)
var str = ""

for i in 0..<len {
    arr[i] = String(word.suffix(i+1))
}

arr.sort(by: <)
for i in 0..<len {
    str += "\(arr[i])\n"
}
print(str)