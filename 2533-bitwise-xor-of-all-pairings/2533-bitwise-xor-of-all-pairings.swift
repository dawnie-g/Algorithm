class Solution {
    func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let count1 = nums1.count
        let count2 = nums2.count
        var ans: Int = 0

        for i in 0..<count1 {
            for j in 0..<count2 {
                ans ^= nums1[i] ^ nums2[j]
            }
        }

        return ans
    }
}