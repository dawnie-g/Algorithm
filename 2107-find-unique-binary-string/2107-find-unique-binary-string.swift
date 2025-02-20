class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        let n = nums.count
        guard n > 1 else { return nums[0] == "0" ? "1" : "0" }

        let maxValue = Int(pow(2.0, Double(n-1))) << 1

        for dec in 0..<maxValue {
            let binaryString = String(dec, radix: 2)
            let resultString = String(repeating: "0", count: n - binaryString.count) + binaryString
            if !nums.contains(resultString) { return resultString }
        }

        return ""
    }
}