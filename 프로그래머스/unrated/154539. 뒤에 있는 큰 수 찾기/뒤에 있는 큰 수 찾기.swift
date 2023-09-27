import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = [Int](repeating: -1, count: numbers.count)
    var idx = numbers.count - 1
    var big = [numbers[idx]]
    
    while idx > 0 {
        idx -= 1
        for i in 0..<big.count {
            if numbers[idx] < big[i] {
                result[idx] = big[i]
                big = Array(big.dropFirst(i))
                if big.first! != numbers[idx] {
                    big.insert(numbers[idx], at: 0)
                }
                break
            } else if i == big.count-1 {
                big = [numbers[idx]]
            }
        }
    }
    
    return result
}