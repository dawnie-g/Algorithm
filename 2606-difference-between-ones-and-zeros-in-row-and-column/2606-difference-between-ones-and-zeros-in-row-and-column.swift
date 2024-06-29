class Solution {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        let m = grid.count
        let n = grid[0].count
        var crossedGrid = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        var altGrid = grid

        for i in 0..<m {
            for j in 0..<n {
                let n = grid[i][j] == 0 ? -1 : 1

                altGrid[i][j] = n
                crossedGrid[j][i] = n
            }
        }

        var rows = [Int]()
        var cols = [Int]()
        for i in 0..<m {
            rows.append(altGrid[i].reduce(0, +))
        }
        for i in 0..<n {
            cols.append(crossedGrid[i].reduce(0, +))
        }

        var diff = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

        for i in 0..<m {
            for j in 0..<n {
                diff[i][j] = rows[i] + cols[j]
            }
        }

        return diff
    }
}