class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var index = digits.count - 1

        while index >= 0 {
            let sum = digits[index] + 1
            guard sum >= 10 else {
                digits[index] = sum
                break
            }
            digits[index] = 0
            index -= 1
        }

        if index == -1 {
            digits.insert(1, at: 0)
        }

        return digits
    }
}