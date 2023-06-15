import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    for i in 1..<words.count {
        if (words[i-1][words[i-1].index(words[i-1].endIndex, offsetBy:-1)] != words[i][words[i].index(words[i].startIndex, offsetBy: 0)]) || (words[0..<i].contains(words[i])){
            return [((i+1) % n == 0 ? n : (i+1) % n), Int(i/n)+1]
        }
    }
    
    return [0,0]
}