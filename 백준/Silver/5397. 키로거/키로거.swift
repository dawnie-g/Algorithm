let n = Int(readLine()!)!

for _ in 0..<n {
    let line = readLine()!.map{$0}
    var left = [Character]()
    var right = [Character]()
    
    for input in line {
        if input.isLetter || input.isNumber {
            left.append(input)
        } else {
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
            default: break
            }
        }
    }
    print(String(left+right.reversed()))
}