class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let n = nums.count
        var sum = [0, 0]

        for i in 0..<n {
            for j in i + 1..<n where nums[i] + nums[j] == target {
                sum = [i, j]
                break
            }
        }

        return sum
    }
}