class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var head = 0
        var tail = 0
        var sum = 0
        var minLen = 100_001

        while tail < nums.count || head < nums.count {
            if sum < target {
                if tail == nums.count { break }
                sum += nums[tail]
                tail += 1
            } else {
                minLen = min(minLen, tail - head)
                sum -= nums[head]
                head += 1
            }
        }

        return minLen == 100_001 ? 0 : minLen
    }
}