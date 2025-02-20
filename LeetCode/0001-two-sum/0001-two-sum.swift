class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let n = nums.count
        var ans = [0, 0]

        for i in 0..<n {
            for j in i + 1..<n {
                if nums[i] + nums[j] == target {
                    ans = [i, j]
                    break
                }
            }
        }

        return ans
    }
}