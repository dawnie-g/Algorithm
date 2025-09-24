class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty, !matrix.first!.isEmpty else { return false }

        let m = matrix.count
        let n = matrix[0].count
        if m == 1 && n == 1 { return matrix[0][0] == target }

        let midRow = m / 2
        let midCol = n / 2
        let midVal = matrix[midRow][midCol]

        let top = 0..<midRow
        let bottom = midRow..<m
        let left = 0..<midCol
        let right = midCol..<n

        if target == midVal { return true }
        let m1 = target < midVal ? Array(matrix[top].map { Array($0[left]) }) : Array(matrix[bottom].map { Array($0[right]) })
        let m2 = midCol > 0 ? Array(matrix[bottom].map { Array($0[left]) }) : [[]]
        let m3 = midRow > 0 ? Array(matrix[top].map { Array($0[right]) }) : [[]]

        return searchMatrix(m1, target) || searchMatrix(m2, target) || searchMatrix(m3, target)
    }
}