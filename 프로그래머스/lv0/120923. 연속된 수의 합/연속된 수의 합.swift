import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    let mid = total / num
    let min = num % 2 == 1 ? mid - (num / 2) : mid - (num / 2) + 1
    let max = mid + (num / 2)
    
    return Array(min...max)
}