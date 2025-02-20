class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var evenDigits = 0

        nums.forEach { num in
            if String(num).count % 2 == 0 {
                evenDigits += 1
            }
        }

        return evenDigits
    }
}