class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let s = s.map { $0 }
        let t = t.map { $0 }
        let sCount = s.count
        var p = 0

        guard sCount > 0 else { return true }

        for i in 0..<t.count {
            if s[p] == t[i] {
                p += 1
            }

            if p == sCount {
                return true
            }
        }

        return false
    }
}