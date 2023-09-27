import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xcnt = [Int](repeating: 0, count: 10)
    var ycnt = [Int](repeating: 0, count: 10)
    var common = [String]()
    
    for x in X {
        xcnt[Int(String(x))!] += 1
    }
    
    for y in Y {
        ycnt[Int(String(y))!] += 1
    }
    
    for i in 0...9 {
        let num = 9-i
        guard xcnt[num] != 0 && ycnt[num] != 0 else { continue }
        common += Array(repeating: String(num), count: min(xcnt[num], ycnt[num]))
    }
    
    
    return common.isEmpty ? "-1" : common.filter{$0 != "0"}.isEmpty ? "0" : common.joined()
}