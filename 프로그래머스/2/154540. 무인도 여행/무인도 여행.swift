import Foundation

func solution(_ maps:[String]) -> [Int] {
    var maps = maps.map{$0.map{$0}}
    var visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    var queue = [(Int, Int)]()
    var days = [Int]()
    
    for i in 0..<maps.count {
        for j in 0..<maps[0].count where !visited[i][j] && maps[i][j].isNumber {
            visited[i][j] = true
            queue.append((i,j))
            var foods = Int(String(maps[i][j]))!
            
            while !queue.isEmpty {
                let curr = queue.removeFirst()
                
                for i in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
                    let nx = curr.0 + i.0
                    let ny = curr.1 + i.1
                    guard (0..<maps.count) ~= nx && (0..<maps[0].count) ~= ny else { continue }
                    guard !visited[nx][ny] && maps[nx][ny].isNumber else { continue }
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                    foods += Int(String(maps[nx][ny]))!
                }
            }
            days.append(foods)
        }
    }
    
    return days.isEmpty ? [-1] : days.sorted()
}