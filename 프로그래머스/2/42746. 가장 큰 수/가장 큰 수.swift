import Foundation

func solution(_ numbers:[Int]) -> String {
    guard numbers.filter{$0 != 0}.count > 0 else { return "0" }
    return numbers.map{String($0)}.sorted {$0 + $1 > $1 + $0}.joined()
}