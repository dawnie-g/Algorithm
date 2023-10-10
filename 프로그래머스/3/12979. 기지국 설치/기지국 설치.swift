import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var idx = 0
    var cur = 1
    let cover = w * 2 + 1
    var cnt = 0
    var trigger = false
    
    while cur <= n {
        let station = stations[idx]
        if cur < station - w || trigger {
            cur += cover
            cnt += 1
        } else {
            cur = station + w + 1
            guard idx < stations.count-1 else { 
                trigger = true
                continue
            }
            idx += 1 
        }
    }
    
    return cnt
}