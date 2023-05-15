import Foundation

func solution(_ s:String) -> [Int] {
    Dictionary (grouping: s.components(separatedBy: "},").flatMap{$0.filter{$0 != "{" && $0 != "}"}.components(separatedBy: ",")}) {$0}.sorted{$0.1.count > $1.1.count}.map{Int($0.0)!}
}