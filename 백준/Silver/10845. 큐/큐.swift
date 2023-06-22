let n = Int(readLine()!)!
var queue = Array(repeating: 0, count: n)
var head = 0
var tail = 0

for _ in 0..<n {
    let command = readLine()!.split(separator: " ")
    switch command.first! {
    case "push":
        queue[tail] = Int(command[1])!
        tail += 1
    case "pop":
        print(head == tail ? -1 : queue[head])
        if head != tail { head += 1 }
    case "front":
        print(head == tail ? -1 : queue[head])
    case "back":
        print(head == tail ? -1 : queue[tail-1])
    case "size":
        print(tail-head)
    case "empty":
        print(head == tail ? 1 : 0)
    default:
        continue
    }
}