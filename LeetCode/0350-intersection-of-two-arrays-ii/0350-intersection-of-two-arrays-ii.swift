class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = Dictionary(grouping: nums1) { $0 }
        var ans = [Int]()

        for num in nums2 {
            guard var nums = dict[num] else { continue }
            nums.removeLast()
            if nums.isEmpty {
                dict[num] = nil
            } else {
                dict[num] = nums
            }
            ans.append(num)
        }

        return ans
    }
}