let n = Int(readLine()!)!
let top = readLine()!.split(separator: " ").map{Int(String($0))!}

var stack = [Int]()
var laser = Array(repeating: 0, count: n)

for i in stride(from: n-1, to: -1, by: -1) {
    while !stack.isEmpty && top[i] > top[stack.last!] {
        laser[stack.last!] = i + 1
        stack.removeLast()
    }
    stack.append(i)
}

print(laser.map{String($0)}.joined(separator: " "))