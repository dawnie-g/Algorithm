class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        var island = 0

        for i in 0..<m {
            for j in 0..<n where !visited[i][j] && grid[i][j] == "1" {
                var queue = [(i, j)]
                var head = 0
                var tail = 1

                while head != tail {
                    let curr = queue[head]
                    head += 1
                    visited[curr.0][curr.1] = true
                    
                    for dir in directions {
                        let x = curr.0 + dir.0
                        let y = curr.1 + dir.1

                        if 0..<m ~= x && 0..<n ~= y && grid[x][y] == "1" && !visited[x][y] {
                            queue.append((x, y))
                            tail += 1
                            visited[x][y] = true
                        }
                    }         
                }

                island += 1
            }
        }

        return island
    }
}