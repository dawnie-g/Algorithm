import Foundation


func solution(_ n:Int) -> Int {
    var digit: Int = 10
    var sum: Int = 0
    
    while n / (digit/10) != 0 {
        sum += n % digit / (digit/10)
        digit *= 10
    }
    
    return sum
}