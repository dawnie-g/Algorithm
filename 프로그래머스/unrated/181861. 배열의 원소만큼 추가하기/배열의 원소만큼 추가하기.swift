import Foundation

func solution(_ arr:[Int]) -> [Int] {
    arr.map{[Int](repeating: $0, count: $0)}.flatMap{$0}
}