class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        var freq: [Character: Int] = [:]
        for char in s {
            freq[char, default: 0] += 1
        }

        guard freq.keys.count >= k || s.count >= k else { return false }

        var remain = k // 짝수개가 아닐 수 있는 글자의 종류 수

        for (char, count) in freq where count % 2 != 0 {
            guard remain > 0 else { return false }
            remain -= 1
        }

        return true
    }
}