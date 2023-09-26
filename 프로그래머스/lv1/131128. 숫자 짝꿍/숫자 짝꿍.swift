import Foundation

func solution(_ X:String, _ Y:String) -> String {
    let X = Dictionary(grouping: X.map{String($0)}) {$0}
    let Y = Dictionary(grouping: Y.map{String($0)}) {$0}
    var common = [String]()

    for i in 0...9 {
        let num = String(9-i)
        var cnt = X.keys.contains(num) && Y.keys.contains(num) ? min(X[num]!.count, Y[num]!.count) : 0
        
        common += Array(repeating: num, count: cnt)
    }
    
    return common.isEmpty ? "-1" : common.filter{$0 != "0"}.isEmpty ? "0" : common.joined()
}