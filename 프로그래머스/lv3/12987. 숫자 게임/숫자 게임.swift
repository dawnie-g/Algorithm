import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted(by: >)
    let b = b.sorted(by: >)
    var score = 0
    var ai = 0
    var bi = 0
    
    while bi < b.count && ai < a.count {
        if a[ai] < b[bi] {
            score += 1
            bi += 1
        }
        ai += 1
    }
    
    return score
}