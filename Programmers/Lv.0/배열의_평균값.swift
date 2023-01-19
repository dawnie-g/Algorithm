import Foundation

func solution(_ numbers:[Int]) -> Double {
    var sum: Int = 0
    
    for i in 0..<numbers.count {
        sum += numbers[i]
    }

    
    return Double(sum) / Double(numbers.count)
}