class Solution {
    func findMaxFish(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        let dir = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        var maxVal = 0

        for r in 0..<m {
            for c in 0..<n where grid[r][c] > 0 && !visited[r][c] {
                var queue = [(r, c)]
                var head = 0
                var tail = 1
                var total = 0
                visited[r][c] = true

                while head < tail {
                    let (nr, nc) = queue[head]
                    total += grid[nr][nc]
                    head += 1

                    for d in dir {
                        let dr = nr + d.0
                        let dc = nc + d.1
                        if 0..<m ~= dr && 0..<n ~= dc && grid[dr][dc] > 0 && !visited[dr][dc] {
                            queue.append((dr, dc))
                            tail += 1
                            visited[dr][dc] = true
                        }
                    }
                }

                maxVal = max(maxVal, total)
            }
        }

        return maxVal
    }
}