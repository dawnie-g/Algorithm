class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var si = s.startIndex
        var ti = t.startIndex

        guard !s.isEmpty else { return true }
        guard !t.isEmpty else { return false }

        while si < s.endIndex && ti < t.endIndex {
            if s[si] == t[ti] {
                si = s.index(after: si)
                if si == s.endIndex {
                    return true
                }
            }
            ti = t.index(after: ti)
        }

        return false
    }
}