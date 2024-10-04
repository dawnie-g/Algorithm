class Solution {
    func countBits(_ n: Int) -> [Int] {
        guard n > 0 else { return [0] }
        var dp = [Int](repeating: 0, count: n + 1)
        var offset = 1

        for i in 1...n {
            if offset * 2 == i {
                offset = i
            }
            dp[i] = 1 + dp[i-offset]
        }
        return dp
    }
}