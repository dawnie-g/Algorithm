import Foundation

func solution(_ order:Int) -> Int {
    var array: [Int] = String(order).map{Int(String($0))!}
    var clap: Int = 0
    
    for num in array{
        switch num{
            case 3, 6, 9: clap += 1
            default: break
        }
    }
    
    return clap
}