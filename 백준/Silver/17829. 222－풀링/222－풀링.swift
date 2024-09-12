import Foundation

var maxIndex = Int(readLine()!)! - 1
var arr = (0...maxIndex).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }

while maxIndex > 0 {
    var newArr: [[Int]] = []
    
    for i in 0..<maxIndex where i % 2 == 0 {
        var newLine: [Int] = []
        for j in 0..<maxIndex where j % 2 == 0 {
            let nums = [arr[i][j], arr[i+1][j], arr[i][j+1], arr[i+1][j+1]]
            let secondNum = nums.sorted(by: >)[1]
            newLine.append(secondNum)
        }
        newArr.append(newLine)
    }
    arr = newArr
    
    maxIndex /= 2
}

print(arr.first!.first!)