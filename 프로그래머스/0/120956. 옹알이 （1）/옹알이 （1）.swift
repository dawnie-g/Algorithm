import Foundation

func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    var babbling = babbling.filter{$0.count > 1}
    var count: Int = 0

    for i in 0..<babbling.count {
        for word in words {
            babbling[i] = babbling[i].replacingOccurrences(of: word, with: " ")
        }
        if babbling[i].allSatisfy { $0 == " "} { count += 1 }
    }

    return count
}