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
        guard head != tail else {
            print(-1)
            continue
        }
        print(queue[head])
        head += 1
    case "front":
        guard head != tail else {
            print(-1)
            continue
        }
        print(queue[head])
    case "back":
        guard head != tail else {
            print(-1)
            continue
        }
        print(queue[tail-1])
    case "size":
        print(tail-head)
    case "empty":
        print(head == tail ? 1 : 0)
    default:
        continue
    }
}