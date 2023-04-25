import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var array: [[String]] = Array(repeatElement([], count: n))
    var who = 0
    array[0].append(words[0])
    
    for i in 1..<words.count {
        who = who == n-1 ? 0 : who + 1
        
        guard !array.flatMap{$0}.contains(words[i]) && words[i-1].last == words[i].first else {
            return [who+1, array[who].count+1]
        }
        array[who].append(words[i])
    }
    
    return [0,0]
}