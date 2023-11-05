import Foundation

let n = Int(readLine()!)!
var arr = [String](repeating: "", count: n)
var maxCount = 0
var card = Int.max

for i in 0..<n {
    arr[i] = readLine()!
}

let dic = Dictionary(grouping: arr) {$0}

for i in dic where maxCount < i.value.count || (maxCount == i.value.count && Int(i.key)! < card) {
    card = Int(i.key)!
    maxCount = i.value.count
}
print(card)