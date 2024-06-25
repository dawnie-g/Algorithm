class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var currSum = nums[0..<k].reduce(0, +)
        var maxSum = currSum
        let n = nums.count

        for i in 0..<n-k {
            currSum -= nums[i]
            currSum += nums[i + k]

            if maxSum < currSum {
                maxSum = currSum
            }
        }

        return Double(maxSum) / Double(k)
    }
}