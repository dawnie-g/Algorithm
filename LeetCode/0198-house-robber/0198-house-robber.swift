class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        
        guard n > 1 else { return nums[0] }
        guard n > 2 else { return max(nums[0], nums[1]) }

        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])

        for i in 2..<n {
            dp[i] = max(dp[i-2] + nums[i], dp[i-1])
        }
        
        return max(dp[n-1], dp[n-2])
    }
}