outer: while true {
    let sentence = readLine()!
    guard sentence != "." else { break }
    var bracket = [Character]()
    
    for c in sentence {
        switch c {
        case "(", "[":
            bracket.append(c)
        case ")", "]":
            guard !bracket.isEmpty else { 
                print("no")
                continue outer
            }
            if (c == ")" && bracket.last! == "(") || (c == "]" && bracket.last! == "[") {
                bracket.removeLast()
            } else {
                print("no")
                continue outer
            }
        case ".":
            print(bracket.isEmpty ? "yes" : "no")
            break
        default: continue
        }
    }
}