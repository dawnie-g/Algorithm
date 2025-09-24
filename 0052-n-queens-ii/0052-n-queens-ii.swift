class Solution {
    func totalNQueens(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var count = 0
        var underAttack = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var attack = [[(Int, Int)]]()

        backtracking(0)

        func backtracking(_ row: Int) {
            for col in 0..<n where !underAttack[row][col] {
                placeQueen(row, col)
                if row + 1 == n {
                    count += 1
                } else {
                    backtracking(row + 1)
                }
                removeQueen(row, col)
            }
        }

        func placeQueen(_ row: Int, _ col: Int) {
            var array = [(Int, Int)]()
            for i in 0..<n {
                for j in 0..<n where !underAttack[i][j] && (i == row || j == col || abs(row - i) == abs(col - j)) {
                    underAttack[i][j] = true
                    array.append((i, j))
                }
            }
            attack.append(array)
        }

        func removeQueen(_ row: Int, _ col: Int) {
            let array = attack.removeLast()
            array.forEach { row, col in
                underAttack[row][col] = false
            }
        }

        return count
    }
}