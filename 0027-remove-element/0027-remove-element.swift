class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var cnt = 0

        for i in 0..<nums.count where nums[i] != val {
            cnt += 1
        }

        nums = nums.filter { $0 != val }
        
        return cnt
    }
}