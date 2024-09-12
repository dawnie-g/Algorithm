class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var idx1 = 0
        var idx2 = 0
        var result: [Int] = []

        while idx1 < m || idx2 < n {
            print(idx1, idx2)

            guard idx1 < m else { 
                result.append(nums2[idx2])
                idx2 += 1
                continue
            }

            guard idx2 < n else { 
                result.append(nums1[idx1])
                idx1 += 1
                continue
            }

            if nums1[idx1] < nums2[idx2] {
                result.append(nums1[idx1])
                idx1 += 1
            } else {
                result.append(nums2[idx2])
                idx2 += 1
            }
        }

        nums1 = result
    }
}