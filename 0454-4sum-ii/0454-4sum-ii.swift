class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        let n = nums1.count
        var dict: [Int: Int] = [:]
        var count = 0
        
        for i in 0..<n {
            for j in 0..<n {
                let num = nums3[i] + nums4[j]
                dict[num, default: 0] += 1
            }
        }

        for i in 0..<n {
            for j in 0..<n {
                guard let numberOfFind = dict[0 - (nums1[i] + nums2[j])] else { continue }
                count += numberOfFind
            }
        }

        return count
    }
}