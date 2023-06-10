import Foundation

func solution(_ dartResult:String) -> Int {
    var score = [Int]()
    var endIndex = 0

    for c in dartResult {
        if c.isNumber {
            if score.isEmpty && c == "0" {
                score.append(0)
            } else if c == "0" && score[endIndex] == 1 {
                score[endIndex] = 10
            } else {
                score.append(Int(String(c))!)
            }
            endIndex = score.endIndex-1
        } else {
            switch c {
            case "D": 
                score[endIndex] *= score[endIndex]
            case "T": 
                score[endIndex] *= (score[endIndex] * score[endIndex])
            case "*":
                score[endIndex] *= 2
                guard endIndex > 0 else { continue }
                score[endIndex-1] *= 2
            case "#": 
                score[endIndex] *= -1
            default : 
                continue
            }
        }
    }
    return score.reduce(0, +)
}