func AC() -> String {
    let cmd = readLine()!.map{String($0)}
    let lastIndex = Int(readLine()!)! - 1
    
    var string = readLine()!
    string.removeLast()
    string.removeFirst()
    var array = string.split(separator: ",")
    
    var head = 0
    var tail = lastIndex
    var rvs = false
    
    for c in cmd {
        switch c {
        case "D":
            guard head <= tail else { return "error" }
            if rvs { // reversed
                tail -= 1
            } else { // not reversed
                head += 1
            }
        case "R":
            rvs.toggle()
        default: break
        }
    }
    var result = tail >= head ? Array(array[head...tail]) : []
    result = rvs ? result.reversed() : result
    return "[\(result.joined(separator: ","))]"
}

for _ in 0..<Int(readLine()!)! {
    print(AC())
}