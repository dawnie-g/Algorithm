class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let n = s.count
        let s = s.map { $0 }
        let t = t.map { $0 }
        var dict1: [Character: Character] = [:]
        var dict2: [Character: Character] = [:]

        for i in 0..<n {
            let c1 = s[i]
            let c2 = t[i]

            if let iso1 = dict1[c1], iso1 != c2 { return false }
            if let iso2 = dict2[c2], iso2 != c1 { return false }

            dict1[c1] = c2
            dict2[c2] = c1
        }

        return true
    }
}