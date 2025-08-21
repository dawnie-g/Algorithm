class Solution {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var hashSet = Set<Int>()

        while n != 1 {
            if hashSet.contains(n) { return false }
            hashSet.insert(n)
            n = sumDigitSquare(of: n)
            print(n)
        }

        return true
    }

    private func sumDigitSquare(of num: Int) -> Int {
        var num = num
        var sum = 0

        while num > 0 {
            let digit = num % 10
            sum += digit * digit
            num /= 10
        }

        return sum
    }
}