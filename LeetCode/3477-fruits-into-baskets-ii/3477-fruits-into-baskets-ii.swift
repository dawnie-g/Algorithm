class Solution {
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        let n = fruits.count
        var visited = [Bool](repeating: false, count: n)
        var ans = 0

        f: for fruit in fruits {
            for i in 0..<n where !visited[i] && fruit <= baskets[i] {
                visited[i] = true
                continue f
            }
            ans += 1
        }

        return ans
    }
}