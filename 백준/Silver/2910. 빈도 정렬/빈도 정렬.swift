import Foundation

let nc = readLine()!.split(separator: " ")
let n = Int(nc[0])!, c = Int(nc[1])!
var numbers = readLine()!.split(separator: " ").map{Int($0)!}

var arr = Array(repeating: (0, 0, 0), count: n+1) // num, order, freq
var order = 0
var visited = Array(repeating: 0, count: n+1)
var str = ""

for i in 0..<n {
    let num = numbers[i]
    if !visited.contains(num) {
        visited[order] = num
        arr[order] = (num, order, 1)
        order += 1
    } else {
        arr[visited.firstIndex(of: num)!].2 += 1
    }
}
arr.sort { ($0.2, $1.1) >= ($1.2, $0.1) }

for num in arr where num.2 != 0 {
    str += Array(repeating: String(num.0), count: num.2).joined(separator: " ") + " "
}
str.removeLast()
print(str)