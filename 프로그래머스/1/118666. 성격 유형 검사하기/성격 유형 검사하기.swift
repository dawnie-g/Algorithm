import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var kbti: [Character:Int] = ["R":0, "C":0, "J":0, "A":0, "T":0, "F":0, "M":0, "N":0]
    var result = [(Character,Int)](repeating: (" ", -1), count: 4)
    
    for score in zip(survey, choices) {
        let letter = score.1 > 4 ? score.0.last! : score.0.first!
        if let cnt = kbti[letter] {
            kbti[letter] = cnt + abs(score.1 - 4)
        }
    }
    
    for type in kbti {
        var idx: Int {
            switch type.key {
                case "R", "T": return 0
                case "C", "F": return 1
                case "J", "M": return 2
                case "A", "N": return 3
                default: return 4
            }
        }
        
        if result[idx].1 < type.value || result[idx].1 == type.value && type.key < result[idx].0 {
            result[idx] = (type.key, type.value)
        }
    }
    
    return result.map{String($0.0)}.joined()
}