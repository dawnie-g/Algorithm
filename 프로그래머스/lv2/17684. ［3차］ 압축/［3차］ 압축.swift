func solution(_ msg:String) -> [Int] {
    var msg = Array(msg)
    var letters = ["", "A", "B", "C", "D", "E", "F", "G", "H",
                   "I", "J", "K", "L", "M", "N", "O", "P", "Q",
                   "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var idx = 0
    var ans: [Int] = []
    
    while idx < msg.count {
        var cur = ""
        for i in idx..<msg.count {
            cur += String(msg[i])
            guard letters.contains(cur) else { 
                letters.append(cur)
                cur.removeLast()
                break
            }
        }
        ans.append(letters.firstIndex(of: cur)!)
        idx += cur.count
    }
    
    return ans
}