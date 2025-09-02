class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let len = nums.count
        let cutPoint = len - (k % len)
        let tail = nums[0..<cutPoint]
        nums.removeFirst(cutPoint)
        nums += tail
    }
}