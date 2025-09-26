class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var visited = [Bool](repeating: false, count: n + 1)
        var output: [[Int]] = []

        recur(0, [])

        func recur(_ depth: Int, _ combi: [Int]) {
            if depth == k {
                output.append(combi)
                return
            }

            for i in (combi.last ?? 1)...n where !visited[i] {
                visited[i] = true
                recur(depth + 1, combi + [i])
                visited[i] = false
            }
        }   

        return output
    }
}