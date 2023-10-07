import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted(by: >)
    let b = b.sorted(by: >)
    var i = 0
    
    for n in a {
        if n < b[i] {
            i += 1
        }
    }
    
    return i
}