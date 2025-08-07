class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 1

        for i in 0..<nums.count-1 where nums[i] != nums[i+1] {
            nums[k] = nums[i+1]
            k += 1
        }

        return k
    }
}