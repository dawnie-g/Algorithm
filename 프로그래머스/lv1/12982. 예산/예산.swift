import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sum = 0
    var count = 0
    
    for money in d.sorted() {
        if sum + money <= budget {
            sum += money
            count += 1
        }else {
            break
        }
    }
    
    return count
}