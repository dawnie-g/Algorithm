import Foundation

func solution(_ s:String) -> Int {
    let s = s.map{$0}
    var first = s[0]
    var cnt = 0
    
    var same = 1
    var diff = 0
    for i in 1..<s.count {
        if same == diff && same != 0 {
            first = s[i]
            same = 1
            diff = 0
            cnt += 1
            continue
        }
        
        if first == s[i] {
            same += 1
        } else {
            diff += 1
        }
    }
    
    return cnt + 1
}