class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let word1 = word1.map { $0 }
        let word2 = word2.map { $0 }
        let size1 = word1.count
        let size2 = word2.count
        let minSize = min(size1, size2)
        var ans = ""

        if size1 != size2 {
            for i in 0..<minSize {
                ans += String(word1[i])
                ans += String(word2[i])
            }
            ans += size1 > size2 ? String(word1[minSize...size1 - 1]) : String(word2[minSize...size2 - 1])
        } else {
            for i in 0..<size1 {
                ans += String(word1[i])
                ans += String(word2[i])
            }
        }

        return ans
    }
}