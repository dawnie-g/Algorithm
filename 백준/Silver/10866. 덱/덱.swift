let n = Int(readLine()!)!
var deque = [String](repeating: "", count: 2*n+1)
var head = n, tail = n

for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map{String($0)}
    switch command.first! {
    case "push_front":
        head -= 1
        deque[head] = command.last!
    case "push_back":
        deque[tail] = command.last!
        tail += 1
    case "pop_front":
        if deque[head] == "" {
            print("-1")
        } else {
            print(deque[head])
            deque[head] = ""
            head += 1
        }
    case "pop_back":
        if deque[tail-1] == "" {
            print("-1")
        } else {
            print(deque[tail-1])
            deque[tail-1] = ""
            tail -= 1
        }
    case "size":
        print(tail-head)
    case "empty":
        print(tail-head == 0 ? 1 : 0)
    case "front":
        print(deque[head] == "" ? -1 : deque[head])
    case "back":
        print(deque[tail-1] == "" ? -1 : deque[tail-1])
    default: break
    }
}