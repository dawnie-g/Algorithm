class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var tri: [[Int]] = []

        for row in 0..<numRows {
            var array = [Int](repeating: -1, count: row + 1)
            array[0] = 1
            array[row] = 1
            print(array)

            for i in 0..<row where array[i] == -1 {
                array[i] = tri[row-1][i-1] + tri[row-1][i]
            }

            tri.append(array)
        }

        return tri
    }
}