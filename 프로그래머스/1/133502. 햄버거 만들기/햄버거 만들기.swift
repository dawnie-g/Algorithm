import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack = [Int](repeating: 0, count: 1_000_000)
    var idx = 0
    var burger = 0
    
    for i in ingredient {
        if idx > 2 && i == 1 && stack[idx-3...idx-1] == [1, 2, 3] {
            stack[idx-3] = 0
            stack[idx-2] = 0
            stack[idx-1] = 0
            idx -= 3
            burger += 1
        } else {
            stack[idx] = i
            idx += 1
        }
    }
    return burger
}