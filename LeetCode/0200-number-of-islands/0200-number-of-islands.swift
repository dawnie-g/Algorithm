class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid[0].count

        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        var island = 0

        

        for i in 0..<m {
            for j in 0..<n where !visited[i][j] && grid[i][j] == "1" {
                var queue = [(i, j)]
                var head = 0
                var tail = 1

                while head < tail {
                    let curr = queue[head]
                    head += 1
                    visited[curr.0][curr.1] = true

                    for dir in directions {
                    let dx = curr.0 + dir.0
                    let dy = curr.1 + dir.1

                    guard 0..<m ~= dx && 0..<n ~= dy && !visited[dx][dy] && grid[dx][dy] == "1" else { continue }
                        queue.append((dx, dy))
                        tail += 1
                        visited[dx][dy] = true
                    }
                }
                island += 1
            }
        }

        return island
    }
}