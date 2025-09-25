class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        var numsInRow: [Int: [Character]] = [:]
        var numsInCol: [Int: [Character]] = [:]
        var numsInBox: [Int: [Character]] = [:]
        for r in 0..<9 {
            for c in 0..<9 where board[r][c].isNumber {
                numsInRow[r, default: []].append(board[r][c])
                numsInCol[c, default: []].append(board[r][c])
                let boxIndex = (r / 3 * 3) + (c / 3)
                numsInBox[boxIndex, default: []].append(board[r][c])
            }
        }

        backtracking(0, 0)

        func backtracking(_ row: Int, _ col: Int) -> Bool {
            if row == 9 { return true }
            let nextRow = row + (col == 8 ? 1 : 0)
            let nextCol = (col + 1) % 9
            let boxIndex = row / 3 * 3 + col / 3
            
            guard board[row][col] == "." else { return backtracking(nextRow, nextCol) }

            for num in "123456789" where isValid(row, col, num) {
                board[row][col] = num
                numsInRow[row, default: []].append(num)
                numsInCol[col, default: []].append(num)
                numsInBox[boxIndex, default: []].append(num)
                if backtracking(nextRow, nextCol) { return true }
                board[row][col] = "."
                numsInRow[row] = numsInRow[row]!.filter { $0 != num }
                numsInCol[col] = numsInCol[col]!.filter { $0 != num }
                numsInBox[boxIndex] = numsInBox[boxIndex]!.filter { $0 != num }
            }
            return false
        }

        func isValid(_ row: Int, _ col: Int, _ num: Character) -> Bool {
            let boxIndex = row / 3 * 3 + col / 3
            return !numsInRow[row, default: []].contains(num) 
                && !numsInCol[col, default: []].contains(num) 
                && !numsInBox[boxIndex, default: []].contains(num)
        }
    }

}