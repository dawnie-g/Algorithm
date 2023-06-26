let stick = readLine()!
var stack = [Character]()
var prev: Character = "_"
var count = 0

for p in stick {
    if p == "(" {
        stack.append(p)
    } else {
        stack.removeLast()
        if prev == "(" {
            count += stack.count
        } else {
            count += 1
        }
    }
    prev = p
}

print(count)