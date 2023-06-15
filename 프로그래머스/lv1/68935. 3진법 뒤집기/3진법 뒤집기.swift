import Foundation

func solution(_ n:Int) -> Int {
    var base3 = Array(String(n, radix: 3))
    base3.reverse()
    
    return Int(base3.map{String($0)}.joined(), radix: 3) ?? 0
}