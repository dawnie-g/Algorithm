import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var handOrder = ""
    var L: Int?
    var R: Int?
    
    for number in numbers {
        switch number {
        case 1, 4, 7:
            handOrder.append("L")
            L = number
        case 3, 6, 9:
            handOrder.append("R")
            R = number
        default:
            let numberLine = number == 0 ? 3 : (number-1) / 3
            let lLine = (L == 0 || L == nil) ? 3 : (L!-1) / 3
            let rLine = (R == 0 || R == nil) ? 3 : (R!-1) / 3
            
            let n = number == 0 ? 11 : number
            var LD: Int {
                if [2, 5, 8].contains(L) {
                    return abs(n - L!) / 3
                } else if L == 0 {
                    return (11 - n) / 3
                } else {
                    return abs(lLine - numberLine) + 1
                }
            }
            
            var RD: Int {
                if [2, 5, 8].contains(R) {
                    return abs(n - R!) / 3
                } else if R == 0 {
                    return (11 - n) / 3
                } else {
                    return abs(rLine - numberLine) + 1
                }
            }
            
            if LD == RD {
                if hand == "left" {
                    L = number
                } else {
                    R = number
                }
                handOrder.append(hand.first!.uppercased())
            } else if LD < RD {
                L = number
                handOrder.append("L")
            } else {
                R = number
                handOrder.append("R")
            }
        }
    }
    
    return handOrder
}