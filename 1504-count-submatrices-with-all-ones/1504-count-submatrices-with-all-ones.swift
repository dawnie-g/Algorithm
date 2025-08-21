class Solution {
    func numSubmat(_ mat: [[Int]]) -> Int {
        let m = mat.count
        let n = mat[0].count
        var count = 0

        let allOne = mat.allSatisfy({ $0.allSatisfy({ $0 == 1 }) })

        for i in 0..<m {
            for j in 0..<n where mat[i][j] == 1 {
                for rowEnd in i..<m {
                    for colEnd in j..<n where allOne || submatrixWithAllOne(i, rowEnd, j, colEnd) {
                        count += 1
                    }
                }
            }
        }

        return count

        // MARK: - helper

        func submatrixWithAllOne(_ rowStart: Int, _ rowEnd: Int, _ colStart: Int, _ colEnd: Int) -> Bool {
            for r in rowStart...rowEnd {
                for c in colStart...colEnd where mat[r][c] == 0 {
                    return false
                }
            }

            return true
        }
    }
}