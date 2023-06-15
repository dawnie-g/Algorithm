import Foundation

func solution(_ s:String) -> String {
    Dictionary(grouping: Array(s), by: {$0})
        .filter{$0.value.count <= 1}
        .map{String($0.value)}
        .sorted()
        .joined()
}