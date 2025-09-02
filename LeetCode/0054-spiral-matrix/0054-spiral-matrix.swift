class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let m = matrix.count
        let n = matrix[0].count
        var r: (start: Int, end: Int) = (-1, m)
        var c: (start: Int, end: Int) = (-1, n)
        var (dr, dc) = (0, 1)
        var curr: (r: Int, c: Int) = (0, 0)
        var ans = [Int]()
        ans.reserveCapacity(m*n)

        for _ in 0..<m*n {
            print(curr)
            let num = matrix[curr.r][curr.c]
            ans.append(num)

            switch (curr.r + dr, curr.c + dc) {
                case (r.start, _):
                (dr, dc) = (0, 1)
                c.start += 1

                case (r.end, _):
                (dr, dc) = (0, -1)
                c.end -= 1

                case (_, c.start):
                (dr, dc) = (-1, 0)
                r.end -= 1

                case (_, c.end):
                (dr, dc) = (1, 0)
                r.start += 1

                default: break
            }

            curr.r += dr
            curr.c += dc
        }

        return ans
    }
}