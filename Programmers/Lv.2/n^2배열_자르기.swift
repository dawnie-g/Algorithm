import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    (left...right).map{max(Int($0) / n, Int($0) % n) + 1}
}