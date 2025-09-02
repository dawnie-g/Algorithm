class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let m = mat.count
        let n = mat[0].count
        var (dr, dc) = (-1, 1)
        var ans: [Int] = []
        ans.reserveCapacity(m*n)
        var curr: (r: Int, c: Int) = (0, 0)

        for _ in 0..<m*n {
            let num = mat[curr.r][curr.c]
            ans.append(num)

            switch (curr.r + dr, curr.c + dc) {
                case (m, _):
                curr.c += 1
                (dr, dc) = (-1, 1)

                case (_, n):
                curr.r += 1
                (dr, dc) = (1, -1)

                case (-1, _):
                curr.c += 1
                (dr, dc) = (1, -1)

                case (_, -1):
                curr.r += 1
                (dr, dc) = (-1, 1)

                default:
                curr.r += dr
                curr.c += dc
            }
        }

        return ans
    }
}