class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        backtracking(0, 0)

        func backtracking(_ row: Int, _ col: Int) -> Bool {
            if row == 9 { return true }
            let nextRow = row + (col == 8 ? 1 : 0)
            let nextCol = (col + 1) % 9
            let boxIndex = row / 3 * 3 + col / 3
            
            guard board[row][col] == "." else { return backtracking(nextRow, nextCol) }

            for num in "123456789" where isValid(row, col, num) {
                board[row][col] = num
                if backtracking(nextRow, nextCol) { return true }
                board[row][col] = "."
            }
            return false
        }

        func isValid(_ row: Int, _ col: Int, _ num: Character) -> Bool {
            if board[row].contains(num) { return false }
            if (0..<9).map { board[$0][col] }.contains(num) { return false }
            
            for r in (row / 3 * 3)..<(row / 3 + 1) * 3 {
                for c in (col / 3 * 3)..<(col / 3 + 1) * 3 where board[r][c] == num {
                    return false
                }
            }

            return true
        }
    }

}