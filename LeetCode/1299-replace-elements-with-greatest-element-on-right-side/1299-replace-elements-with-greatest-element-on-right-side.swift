class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        let len = arr.count
        var ans = arr
        var maxVal = ans[len - 1]
        ans[len - 1] = -1

        for i in stride(from: len - 2, to: -1, by: -1) {
            let currMax = maxVal
            maxVal = max(maxVal, ans[i])
            ans[i] = currMax
        }

        return ans
    }
}