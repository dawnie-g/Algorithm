class Solution {
    func maxScore(_ s: String) -> Int {
        var left = 0
        var right = 0
        var maxVal = Int.min
        var i = s.startIndex

        while i < s.index(before: s.endIndex) {
            if s[i] == "0" {
                left += 1
            } else {
                right += 1
            }
            
            maxVal = max(maxVal, left - right) // (왼쪽의 0의 수) - (왼쪽으로 1이 넘어간 수)
            i = s.index(after: i)
        }

        if s.last == "1" {
            right += 1
        }

        return maxVal + right
    }
}