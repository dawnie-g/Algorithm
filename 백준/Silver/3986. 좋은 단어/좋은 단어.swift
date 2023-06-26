let n = Int(readLine()!)!
var count = 0

for _ in 0..<n {
    let string = readLine()!
    var stack = [Character]()
    for c in string {
        if stack.contains(c) && stack.last! == c {
            stack.removeLast()
        } else {
            stack.append(c)
        }
    }
    count += stack.isEmpty ? 1 : 0
}

print(count)