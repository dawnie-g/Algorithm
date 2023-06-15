import Foundation

func solution(_ n:Int) -> Int {
    var count: Int = 0
    var result: Int = 0
    var array = Array(1...n).map{Array(1...$0)}
    
    for i in array{
        for j in i where i.count % j == 0{
            count += 1
        }
        if count > 2 {
            result += 1
        }
        count = 0
    }
    
    return result
}