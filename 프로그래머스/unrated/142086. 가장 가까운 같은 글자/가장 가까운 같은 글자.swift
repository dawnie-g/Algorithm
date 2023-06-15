import Foundation

func solution(_ s:String) -> [Int] {
    s.enumerated().map{ (i, c) in
        i - (Array(s)[0..<i].lastIndex(of: c) ?? i+1 )
    }
}