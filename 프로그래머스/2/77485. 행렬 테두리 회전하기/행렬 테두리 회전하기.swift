import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var line = Array(1...columns)
    var table = [[Int]]()
    for _ in 0..<rows {
        table.append(line)
        line = line.map{ $0 + columns }
    }
    let origin = table
    var ans = [Int]()
    
    for query in queries {
        var r = query[0] - 1
        var c = query[1] - 1
        var prevVal = table[r][c]
        var minVal = prevVal
        
        repeat {
            if r == query[0] - 1 && c + 1 <= query[3] - 1 {
                c += 1
            } else if r == query[2] - 1 && c - 1 >= query[1] - 1 {
                c -= 1
            } else if r + 1 <= query[2] - 1 && c == query[3] - 1 {
                r += 1
            } else if r - 1 >= query[0] - 1 && c == query[1] - 1 {
                r -= 1
            }
            let currVal = table[r][c]
            table[r][c] = prevVal
            prevVal = currVal
            
            if prevVal < minVal {
                minVal = prevVal
            }
        } while r != query[0] - 1 || c != query[1] - 1
        
        ans.append(minVal)
    }
    
    return ans
}