class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        let size = nums.count
        var start = -1
        var maxLen = 0

        for curr in 0..<size where nums[curr] == 0 {
            maxLen = max(maxLen, curr - start - 1)
            start = curr
        }

        if nums[size - 1] == 1 {
            maxLen = max(maxLen, size - start - 1)
        }

        return maxLen
    }
}