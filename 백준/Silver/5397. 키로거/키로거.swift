let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.map{$0}
    var left = [Character]()
    var right = [Character]()
    
    input.forEach {
        switch $0 {
        case "-":
            if !left.isEmpty {
                left.removeLast()
            }
        case "<":
            if !left.isEmpty {
                right.append(left.removeLast())
            }
        case ">":
            if !right.isEmpty {
                left.append(right.removeLast())
            }
        default: 
            left.append($0)
        }
    }
    print(String(left+right.reversed()))
}