let n = Int(readLine()!)!

func star(_ n: Int, pattern: [String]) {
    if n == 3 {
        var blankNum = pattern.last!.count / 2
        for i in 0...blankNum {
            let blank = String(repeating: " ", count: blankNum-i)
            print(blank + pattern[i] + blank)
        }
        return
    }
    
    let between = pattern.last!.count
    let add = (0..<pattern.count).map{pattern[$0] + String(repeating: " ", count: between - 2*$0) + pattern[$0]}
    star(n/2, pattern: pattern + add)
}

star(n, pattern: ["*", "* *", "*****"])