import Foundation

func solution(_ s:String) -> [Int] {
    let nums = Dictionary (grouping: s.components(separatedBy: "},").flatMap{$0.filter{$0 != "{" && $0 != "}"}.components(separatedBy: ",")}) {$0}

    return nums.sorted{$0.1.count > $1.1.count}.map{Int($0.0)!}
}