import Foundation

func solution(_ order:[Int]) -> Int {
    var main = Array((1...order.count).reversed())
    var sub = [Int]()
    var idx = 0
    
    while !main.isEmpty || !sub.isEmpty {
        if !main.isEmpty && order[idx] == main.last! {
            main.removeLast()
            idx += 1
        } else if !sub.isEmpty && order[idx] == sub.last! {
            sub.removeLast()
            idx += 1
        } else {
            guard !main.isEmpty else { break }
            sub.append(main.removeLast())
        }
    }
    
    return idx
}