import Foundation

func solution(_ num:Int, _ k:Int) -> Int { 
    let array: [Int] = String(num).map{Int(String($0))!}
    return array.contains(k) ? array.firstIndex(of: k)! + 1 : -1  }