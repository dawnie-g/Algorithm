import Foundation

func solution(_ n:Int) -> Int {
    var num: Int = 0
    
    for i in 1...n{
        num += 1
        while String(num).contains("3") || num % 3 == 0 {
            num += 1
        }
    }
    
    return num
}