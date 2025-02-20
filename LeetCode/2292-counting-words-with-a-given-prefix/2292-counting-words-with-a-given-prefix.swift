class Solution {
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        var cnt = 0

        for word in words {
            if word.hasPrefix(pref) { cnt += 1 }
        }

        return cnt
    }
}