class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var index: [Int: Int] = [:]

        for i in 0..<nums.count {
            let num = nums[i]
            
            if let index = index[target - num] {
                return [i, index]
            }
            
            index[num] = i
        }

        return []
    }
}