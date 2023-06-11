import Foundation

func solution(_ n:Int) -> Int {
    let base3 = String(n, radix: 3).reversed()
    
    return Int(base3.map{String($0)}.joined(), radix: 3) ?? 0
}