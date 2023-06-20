
let n = Int(readLine()!)!

for _ in 0..<n {
    let line = readLine()!.map{$0}
    var left = [Character]()
    var right = [Character]()
    
    for input in line {
        switch input {
        case "-":
            guard !left.isEmpty else { continue }
            left.removeLast()
        case "<":
            guard !left.isEmpty else { continue }
            right.append(left.removeLast())
        case ">":
            guard !right.isEmpty else { continue }
            left.append(right.removeLast())
        default: 
            left.append(input)
        }
    }
    print(String(left+right.reversed()))
}