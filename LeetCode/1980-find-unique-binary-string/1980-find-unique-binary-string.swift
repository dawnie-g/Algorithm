class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        let n = nums.count
        guard n > 1 else { return nums[0] == "0" ? "1" : "0" }

        var ans = ""
        for dec in 0..<(2 << n) {
            let binaryString = String(dec, radix: 2)
            let resultString = String(repeating: "0", count: n - binaryString.count) + binaryString
            if !nums.contains(resultString) { 
                ans = resultString
                break
            }
        }

        return ans
    }
}