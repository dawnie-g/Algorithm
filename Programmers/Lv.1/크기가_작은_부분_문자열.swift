import Foundation

func solution(_ t:String, _ p:String) -> Int {
    (0...t.count-p.count).map{
        let start = t.index(t.startIndex, offsetBy: $0)
        let end = t.index(t.startIndex, offsetBy: $0+p.count-1)
        return String(t[start...end])
    }.filter{Int($0)! <= Int(p)!}.count
}