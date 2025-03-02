class Solution {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var dict: [Int: Int] = [:]

        for n in nums1 {
            dict[n[0], default: 0] += n[1]
        }

        for n in nums2 {
            dict[n[0], default: 0] += n[1]
        }

        return dict.sorted { $0.key < $1.key }.map { [$0.key, $0.value] }
    }
}