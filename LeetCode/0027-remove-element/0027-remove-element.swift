class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var n = nums.count
        var eqaul = 0
        
        for i in 0..<n where nums[i] == val {
            eqaul += 1
        }

        nums.sort { $0 != val && $1 == val }

        return n - eqaul
    }
}