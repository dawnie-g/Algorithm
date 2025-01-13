class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxVal = 0
        var currVal = 0

        nums.forEach {
            if $0 == 1 {
                currVal += 1
            } else {
                maxVal = max(maxVal, currVal)
                currVal = 0
            }
        }

        return max(maxVal, currVal)
    }
}