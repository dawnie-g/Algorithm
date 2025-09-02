class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var maxVal: (value: Int, index: Int) = (0, 0)
        var second = 0

        for i in 0..<nums.count {
            let num = nums[i]
            if maxVal.value < num {
                second = maxVal.value
                maxVal = (num, i)
            }
        }

        return maxVal.value >= second * 2 ? maxVal.index : -1
    }
}