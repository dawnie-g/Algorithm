import Foundation

func solution(_ numbers:[Int]) -> Int {
    var sortedNumbers: [Int] = numbers.sorted(by: >)
    return sortedNumbers[0] * sortedNumbers[1]
}