import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var log = [String: Int]()
    var score = [String: Int]()
    var nextMonth = [String: Int]()
    
    for gift in gifts {
        let arr = gift.split(separator: " ").map { String($0) }
        let give = arr[0]
        let take = arr[1]
        
        log[gift, default: 0] += 1
        score[give, default: 0] += 1
        score[take, default: 0] -= 1
    }
    
    for i in 0..<friends.count {
        for j in (i + 1)..<friends.count {
            let A = friends[i]
            let B = friends[j]
            let AtoB = log["\(A) \(B)"] ?? 0
            let BtoA = log["\(B) \(A)"] ?? 0
            
            if AtoB > BtoA {
                nextMonth[A, default: 0] += 1
            } else if BtoA > AtoB {
                nextMonth[B, default: 0] += 1
            } else {
                let scoreA = score[A] ?? 0
                let scoreB = score[B] ?? 0
                
                if scoreA > scoreB {
                    nextMonth[A, default: 0] += 1
                } else if scoreB > scoreA {
                    nextMonth[B, default: 0] += 1
                }
            }
        }
    }
    
    return nextMonth.values.max() ?? 0
}