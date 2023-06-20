var left = readLine()!.map{$0}
var right = [Character]()
let n = Int(readLine()!)!

for _ in 0..<n {
    var command = readLine()!
    switch command {
    case "L":
        guard !left.isEmpty else { continue }
        right.append(left.removeLast())
    case "D": 
        guard !right.isEmpty else { continue }
        left.append(right.removeLast())
    case "B":
        guard !left.isEmpty else { continue }
        left.removeLast()
    default:
        left.append(command.last!)
    }
}

print(String(left+right.reversed()))