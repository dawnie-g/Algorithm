class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystack = haystack.map { $0 }
        let needle = needle.map { $0 }
        let hCount = haystack.count
        let nCount = needle.count

        if nCount > hCount { return -1 }

        for i in 0...(hCount - nCount) where haystack[i] == needle.first! {
            if Array(haystack[i..<i+nCount]) == needle {
                return i
            }
        }

        return -1
    }
}