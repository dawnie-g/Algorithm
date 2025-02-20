class Solution {
    func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var ans: Int = 0

        nums1.forEach { n1 in
            nums2.forEach { n2 in
                ans ^= n1 ^ n2
            }
        }

        return ans
    }
}