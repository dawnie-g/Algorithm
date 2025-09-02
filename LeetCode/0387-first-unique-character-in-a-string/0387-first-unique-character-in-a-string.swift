class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let s = s.map { $0 }
        let len = s.count
        var indices: [Character: [Int]] = [:]

        for i in 0..<len{
            let c = s[i]
            indices[c, default: []].append(i)
        }

        var minIdx = len
        indices.values.forEach { array in
            if array.count == 1 { 
                minIdx = min(minIdx, array.first!)
            }
        }

        return minIdx == len ? -1 : minIdx
    }
}