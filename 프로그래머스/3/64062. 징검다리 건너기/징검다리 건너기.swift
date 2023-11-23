import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var minVal = 0 // 다리를 건너는 최소 인원
    var maxVal = stones.max()! // 다리를 건너는 최대 인원
    
    while minVal <= maxVal {
        let mid = (minVal + maxVal) / 2
        var trigger = false
        var cnt = 0
        
        for i in 0..<stones.count {
            cnt = stones[i] <= mid ? cnt + 1 : 0
            guard cnt < k else {
                trigger = true
                break
            }
        }
        if trigger {
            maxVal = mid - 1
        } else {
            minVal = mid + 1
        }
    }
    
    return minVal
}