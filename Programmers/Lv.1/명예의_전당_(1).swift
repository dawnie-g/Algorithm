import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var pawn: [Int] = []
    var result: [Int] = []
    
    for s in score {
        pawn.append(s)
        pawn.sort(by: >)
        if pawn.count > k {
            pawn.remoxveLast()
        }
        result.append(pawn.last!)
    }
    
    return result
}