import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var arr = section
    var count = 0
    
    while !arr.isEmpty {
        let start = arr.removeLast()
        for i in 0..<m {
            if !arr.isEmpty && start-(m-1)..<start ~= arr.last! {
                arr.removeLast()
            } else { count += 1; break }
        }
    }
    return count
}