func AC() -> String {
    let cmd = readLine()!.map{String($0)}
    let lastIndex = Int(readLine()!)! - 1
    var array = readLine()!.filter{$0 != "[" && $0 != "]"}.split(separator: ",")
    var head = 0
    var tail = lastIndex
    var rvs = false
    
    for c in cmd {
        switch c {
        case "D":
            guard head <= tail else {return "error"}
            if rvs { // reversed
                array[tail] = " "
                tail -= 1
            } else { // not reversed
                array[head] = " "
                head += 1
            }
        case "R":
            rvs.toggle()
        default: break
        }
    }
    var result = array.filter{$0 != " "}
    result = rvs ? result.reversed() : result
    return "[\(result.joined(separator: ","))]"
}

for _ in 0..<Int(readLine()!)! {
    print(AC())
}