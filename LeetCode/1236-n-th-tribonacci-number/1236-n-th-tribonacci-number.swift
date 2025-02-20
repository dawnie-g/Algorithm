class Solution {
    func tribonacci(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        guard n > 0 else { return 0 }
        guard n > 2 else { return 1 }

        dp[1] = 1
        dp[2] = 1

        for i in 3...n {
            dp[i] = dp[i-3] + dp[i-2] + dp[i-1]
        }

        return dp[n]
    }
}