import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    let biNums = numbers.map{String($0, radix: 2)}
    var answer = [Int64]()
    
    for b in biNums {
        if !b.contains("0") {
            answer.append(Int64("10" + String(repeating: "1", count: b.count-1), radix: 2)!)
        } else if b.contains("0"){
            if b.last! == "0" {
                answer.append(Int64(b.prefix(b.count-1) + "1", radix: 2)!)
            } else {
                var bRe = b.reversed()
                var bits = ""
                var zero = false
                
                for r in bRe {
                    if r == "0" && !zero {
                        zero = true
                        bits.removeLast()
                        bits += "01"
                    } else {
                        bits += String(r)
                    }
                }
                answer.append(Int64(String(bits.reversed()), radix: 2)!)
            }
        }
    }
    
    return answer
}