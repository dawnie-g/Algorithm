import Foundation

func solution(_ p:String) -> String {
    var v = p
    
    func recursive(v: String) -> String {
        guard !v.isEmpty else { return "" }
        var u = ""
        var v = v
        var openCnt = 0
        var closeCnt = 0
        
        while openCnt != closeCnt || openCnt == 0 {
            u.append(v.removeFirst())
            if u.last! == "(" {
                openCnt += 1
            } else {
                closeCnt += 1
            }
        }
        
        if u.first! == "(" {
            return u + recursive(v: v)
        } else {
            var str = "("
            str += recursive(v: v)
            str += ")"
            
            u.removeFirst()
            u.removeLast()
            for letter in u {
                if letter == "(" {
                    str += ")"
                } else {
                    str += "("
                }
            }
            return str
        } 
    }
    return recursive(v: v)
}