class Solution {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var visited = [Bool](repeating: false, count: 1_000)

        while n != 1 {
            var num = n
            var sum = 0
            while num > 0 {
                let digit = num % 10
                sum += digit * digit
                num /= 10
            }
            guard !visited[sum] else { return false }
            visited[sum] = true
            n = sum
        }

        return n == 1
    }
}