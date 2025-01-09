class Solution {
    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        func isPrefixAndSuffix(_ str1: String, _ str2: String) -> Bool {
            return str2.hasPrefix(str1) && str2.hasSuffix(str1)
        }

        var cnt = 0

        for i in 0..<(words.count - 1) {
            for j in (i + 1)..<words.count where isPrefixAndSuffix(words[i], words[j]) {
                cnt += 1
            }
        }

        return cnt
    }
}