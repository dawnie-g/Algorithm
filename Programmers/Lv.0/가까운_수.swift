import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    array.sorted()[array.sorted().map{abs($0-n)}.firstIndex(of: array.sorted().map{abs($0-n)}.min()!)!]
}