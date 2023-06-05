import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1 = cards1
    var cards2 = cards2
    var now = [cards1.removeFirst(), cards2.removeFirst()]
    
    for word in goal {
        if now.contains(word) {
            if now.firstIndex(of: word)! == 0 {
                guard !cards1.isEmpty else { continue }
                now[0] = cards1.removeFirst()
            } else if now.firstIndex(of: word)! == 1 {
                guard !cards2.isEmpty else { continue }
                now[1] = cards2.removeFirst()
            }
        } else {
            return "No"
        }
    }
    
    return "Yes"
}