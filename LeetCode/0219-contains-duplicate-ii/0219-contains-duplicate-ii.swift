class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict: [Int: Int] = [:]

        for i in 0..<nums.count {
            let num = nums[i]
            guard let j = dict[num] else { dict[num] = i; continue }
            if abs(i-j) <= k { 
                return true
            } else {
                dict[num] = i
            }
        }

        return false
    }
}