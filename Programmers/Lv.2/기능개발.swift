import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var develop = progresses
    var result: [Int] = [0]

    while develop.filter{$0 == -1}.count < progresses.count {
        develop = zip(develop, speeds).map{$0 < 100 && $0 != -1 ? $0 + $1 : $0}    
        for i in 0..<develop.count {
            if develop[i] >= 100 {
                result[result.count-1] += 1
                develop[i] = -1
                if result.reduce(0, +) == progresses.count {
                   return result
                }
            } else if result.last! > 0 {
                result.append(0)
                break
            } else if develop[i] == -1{
                continue
            } else {
                break
            }
        }
    }

    return result
}