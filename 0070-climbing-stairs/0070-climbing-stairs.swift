class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        guard n > 2 else { return 2 }

        var dp = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2]
        }

        return dp[n]
    }
}