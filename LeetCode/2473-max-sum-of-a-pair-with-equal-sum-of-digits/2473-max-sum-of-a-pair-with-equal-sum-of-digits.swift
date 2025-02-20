class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        var dict: [Int: [Int]] = [:]
        var maxVal: Int = -1

        for num in nums {
            var n = num
            var sum = 0

            while n > 0 {
                sum += n % 10
                n /= 10
            }
            
            dict[sum, default: []].append(num)
        }

        for arr in dict.values {
            guard arr.count > 1 else { continue }

            let sortedArr = arr.sorted(by: >)
            maxVal = max(maxVal, sortedArr[0] + sortedArr[1])
        }

        return maxVal
    }
}