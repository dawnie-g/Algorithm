import Foundation

func solution(_ babbling:[String]) -> Int {
    let baby = ["aya", "ye", "woo", "ma"]
    var babbling = babbling.filter{$0.count > 1}
    var count: Int = 0

    for j in 0..<babbling.count {
        for i in 0..<baby.count {
            babbling[j] = babbling[j].replacingOccurrences(of: baby[i], with: " ")
        }
    }

    return babbling.map{$0.components(separatedBy: " ").joined()}.filter{$0 == ""}.count
}