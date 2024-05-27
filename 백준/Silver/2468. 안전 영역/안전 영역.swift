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

for height in minH-1...maxH-1 {
    guard minH != maxH else {
        ans = 1
        break
    }
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var count = 0
    
    for i in 0..<n {
        for j in 0..<n {
            guard heights[i][j] > height && !visited[i][j] else { continue }
            bfs((i, j), height, &visited)
            count += 1
        }
    }
    
    ans = max(ans, count)
}

print(ans)

func bfs(_ start: (Int, Int), _ height: Int, _ visited: inout [[Bool]]) {
    var queue = [start]
    var idx = 0
    visited[start.0][start.1] = true
    
    while queue.count > idx {
        let (x, y) = queue[idx]
        idx += 1
        
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (x + i.0, y + i.1)
            guard 0..<n ~= nx && 0..<n ~= ny && !visited[nx][ny] && heights[nx][ny] > height else { continue }
            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }
}
