import Foundation

func solution(_ numbers:[Int]) -> Int {
    var sorted: [Int] = numbers.sorted()
    
    return max(sorted[0] * sorted[1], sorted[sorted.count-1] * sorted[sorted.count-2])
}