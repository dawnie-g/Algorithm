class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var ans = 0


        for i in 0..<m {
            for j in 0..<n where matrix[i][j] == 1 {
                var side = 1
                while checkOneSquare(ofSide: side, row: i, col: j) {
                    ans += 1
                    side += 1
                }
            }
        }

        return ans

        // MARK: - helper

        func checkOneSquare(ofSide side: Int, row: Int, col: Int) -> Bool {
            let offset = side - 1
            guard (0..<m) ~= row + offset && (0..<n) ~= col + offset else { return false }
            
            for r in row...row + offset {
                for c in col...col + offset where matrix[r][c] == 0 {
                    return false
                }
            }

            return true
        }
    }
    

    
}