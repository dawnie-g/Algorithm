class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var head = 0
        var tail = k
        var currSum = nums[head..<tail].reduce(0, +)
        var maxSum = currSum
        let n = nums.count

        for _ in k..<n {
            currSum -= nums[head]
            currSum += nums[tail]
            head += 1
            tail += 1

            if maxSum < currSum {
                maxSum = currSum
            }
        }

        let average: Double = Double(maxSum) / Double(k)
        let formattedAvg = round(average * 100000) / 100000
        return formattedAvg
    }
}