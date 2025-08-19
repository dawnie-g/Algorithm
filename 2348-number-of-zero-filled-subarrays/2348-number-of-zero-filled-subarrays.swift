class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        var count = 0
        var ans = 0

        for num in nums {
            if num == 0 {
                count += 1
            } else if count > 0 {
                dict[count, default: 0] += 1
                count = 0
            }
        }

        if count > 0 {
            dict[count, default: 0] += 1
            count = 0
        }


        for (n, m) in dict {
            print(n, m)
            ans += m * n * (n+1) / 2 
        }

        return ans
    }
}