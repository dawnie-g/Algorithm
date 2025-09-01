class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var tail = 0

        for i in 0..<nums.count where nums[i] != val {
            nums[tail] = nums[i]
            tail += 1
        }

        return tail
    }
}