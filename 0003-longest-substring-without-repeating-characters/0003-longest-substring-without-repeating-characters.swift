class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = s.map { $0 }
        var lastIndex: [Character: Int] = [:]
        var head = 0
        var tail = 0
        var maxCount = 0

        for i in 0..<s.count {
            let c = s[i]

            if let index = lastIndex[c] {
                maxCount = max(maxCount, tail - head)
                head = max(head, index + 1)
            }
            
            tail += 1
            lastIndex[c] = i
            print(head, tail)
        }

        return max(maxCount, tail - head)
    }
}