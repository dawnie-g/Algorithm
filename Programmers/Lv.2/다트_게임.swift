import Foundation

func solution(_ dartResult:String) -> Int {
    var score = [Int]()
    
    for c in dartResult {
        if c.isNumber {
            score.append(Int(String(c))!)
        } else if c.isLetter {
            switch c {
            case "S": continue
            case "D": score[score.endIndex-1] = pow(score[score.endIndex-1], 2)
            case "T": score[score.endIndex-1] = pow(score[score.endIndex-1], 3)
            case "*":
                score[score.endIndex-1] *= 2
                guard score.endIndex > 1 else { continue }
                score[score.endIndex-2] *= 2
            case "#": score[score.endIndex-1] *= -1
            default : continue
            }
        }
    }
    
    return score.reduce(0, +)
}