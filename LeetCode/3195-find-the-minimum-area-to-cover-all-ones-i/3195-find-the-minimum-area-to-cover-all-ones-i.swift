class Solution {
    func minimumArea(_ grid: [[Int]]) -> Int {
        var minRow = Int.max
        var minCol = Int.max
        var maxRow = Int.min
        var maxCol = Int.min

        for r in 0..<grid.count {
            for c in 0..<grid[0].count where grid[r][c] == 1 {
                minRow = min(minRow, r)
                maxRow = max(maxRow, r)
                minCol = min(minCol, c)
                maxCol = max(maxCol, c)
            }
        }

        return (maxRow - minRow + 1) * (maxCol - minCol + 1)
    }
}