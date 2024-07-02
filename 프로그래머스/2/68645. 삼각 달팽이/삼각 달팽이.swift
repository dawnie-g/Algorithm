import Foundation

func solution(_ n:Int) -> [Int] {
    var arr = [[Int]]()
    
    for i in 1...n {
        arr.append([Int](repeating: 0, count: i))
    }
    
    var curr = 1
    var row = -1
    var col = 0
    
    for i in stride(from: n, to: 0, by: -3) {
        for j in 0..<i {
            row += 1
            arr[row][col] = curr
            curr += 1
        }
        
        guard i-1 > 0 else { continue }
        for j in 0..<i-1 {
            col += 1
            arr[row][col] = curr
            curr += 1
        }
        
        guard i-2 > 0 else { continue }
        for j in 0..<i-2 {
            row -= 1
            col -= 1
            arr[row][col] = curr
            curr += 1
        }
    }
    
    return arr.flatMap{ $0 }
}