import Foundation

func solution(_ babbling:[String]) -> Int {
    return babbling.filter { 
        var word = $0
        ["aya", "ye", "woo", "ma"].forEach {
            word = word.replacingOccurrences(of: $0, with: " ")
        }
        return word.allSatisfy { $0 == " " }
    }.count
}