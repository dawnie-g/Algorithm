class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var ans = 0

        var row = [Int](repeating: 0, count: m)
        var col = [Int](repeating: 0, count: n)

        for i in 0..<m {
            for j in 0..<n where grid[i][j] == 1 {
                row[i] += 1
                col[j] += 1
            }
        }

        for i in 0..<m {
            for j in 0..<n where grid[i][j] == 1 {
                if row[i] > 1 || col[j] > 1 {
                    ans += 1
                }
            }
        }

        return ans
    }
}