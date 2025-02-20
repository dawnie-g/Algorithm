class Solution {
    func countBeautifulPairs(_ nums: [Int]) -> Int {
        func gcd(_ a: Int, _ b: Int) -> Int {
            if b == 0 {
                return a
            }

            return gcd(b, a % b)
        }

        func getFirstDigit(of num: Int) -> Int {
            var digit = 0
            var divider = 10000

            while digit == 0 {
                digit = num / divider
                divider /= 10
            }
            
            return digit
        }

        var pairs = 0

        for i in 0..<(nums.count - 1) {
            for j in (i + 1)..<nums.count {
                let gcd = gcd(getFirstDigit(of: nums[i]), nums[j] % 10)
                if gcd == 1 {
                    pairs += 1
                }
            }
        }

        return pairs
    }
}