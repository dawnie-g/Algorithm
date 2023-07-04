let n = Int(readLine()!)!

func star(_ n: Int) -> [String] {
    if n == 3 { return ["  *  ", " * * ", "*****"] }
    
    let pat = star(n/2)
    let space = String(repeating: " ", count: n/2)
    var result = [String]()
    
    for p in pat { result.append(space + p + space) }
    for p in pat { result.append(p + " " + p) }
    
    return result
}

print(star(n).joined(separator: "\n"))