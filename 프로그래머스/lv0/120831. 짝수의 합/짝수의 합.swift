import Foundation

func solution(_ n:Int) -> Int {
    guard n > 0 && n <= 1000 else { return 0 }
    var sum: Int = 0
    
    for i in 1...n where i % 2 == 0 {
        sum += i
    }
    
    return sum
}