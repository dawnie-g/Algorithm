import Foundation

let n = Int(readLine()!)!
var heights = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var minH = Int.max
var maxH = Int.min
var ans = 0

for i in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    heights[i] = line
    for j in 0..<n {
        minH = min(minH, heights[i][j])
        maxH = max(maxH, heights[i][j])
    }
}

let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

func bfs(_ start: (Int, Int), _ height: Int, _ visited: inout [[Bool]]) {
    var queue = [start]
    var idx = 0
    visited[start.0][start.1] = true
    
    while idx < queue.count {
        let (x, y) = queue[idx]
        idx += 1
        
        for dir in directions {
            let nx = x + dir.0
            let ny = y + dir.1
            
            if nx >= 0 && nx < n && ny >= 0 && ny < n && !visited[nx][ny] && heights[nx][ny] > height {
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
}

for height in (minH-1)...(maxH-1) {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var count = 0
    
    for i in 0..<n {
        for j in 0..<n {
            if heights[i][j] > height && !visited[i][j] {
                bfs((i, j), height, &visited)
                count += 1
            }
        }
    }
    
    ans = max(ans, count)
}

print(ans)
