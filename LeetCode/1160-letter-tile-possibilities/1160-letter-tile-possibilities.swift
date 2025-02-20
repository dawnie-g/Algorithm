class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        var sequences = Set<String>()
        var visited = [Bool](repeating: false, count: tiles.count)

        func permute(_ targetArr: [String], _ targetNum: Int, _ index: Int, _ str: String) {
            if str.count == targetNum {
                sequences.insert(str)
                return
            }

            for i in 0..<targetArr.count {
                if !visited[i] {
                    visited[i] = true
                    permute(targetArr, targetNum, i + 1, str + targetArr[i] )
                    visited[i] = false
                }
            }
        }

        for i in 1...tiles.count {
            permute(tiles.map { String($0) }, i, 0, "")
        }

        return sequences.count
    }
}