import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = []
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            let sum = numbers[i] + numbers[j]
            if !result.contains(sum) {
                result.append(sum)
            }
        }
    }
    
    return result.sorted()
}