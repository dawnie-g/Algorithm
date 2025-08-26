class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var row: [Int: [Character]] = [:]
        var col: [Int: [Character]] = [:]
        var box: [String: [Character]] = [:]

        for i in 0..<9 {
            for j in 0..<9 where board[i][j] != "." {
                let num = board[i][j]
                guard !row[i, default: []].contains(num), !col[j, default: []].contains(num),
                    !box["\(i/3)\(j/3)", default: []].contains(num) else { return false }
                
                row[i, default: []].append(num)
                col[j, default: []].append(num)
                box["\(i/3)\(j/3)", default: []].append(num)
            }
        }

        return true
    }
}