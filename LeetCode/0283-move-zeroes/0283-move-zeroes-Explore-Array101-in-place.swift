class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        nums.sort { $0 != 0 && $1 == 0 }
    }
}