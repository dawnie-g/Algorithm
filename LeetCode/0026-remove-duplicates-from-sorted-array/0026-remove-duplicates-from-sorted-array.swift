class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var tail = 0

        for i in 0..<nums.count where nums[i] != nums[tail] {
            tail += 1
            nums[tail] = nums[i]
        }

        if nums[tail] != nums.last! {
            tail += 1
            nums[tail] = nums.last!
        }

        return tail == 0 ? 1 : tail + 1
    }
}