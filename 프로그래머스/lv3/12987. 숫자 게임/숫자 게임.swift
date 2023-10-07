import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted(by: >)
    let b = b.sorted(by: >)
    var ai = 0
    var bi = 0
    
    while bi < b.count && ai < a.count {
        if a[ai] < b[bi] {
            bi += 1
        }
        ai += 1
    }
    
    return bi
}