class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagrams: [String: [String]] = [:]

        for str in strs {
            let key = String(str.sorted(by: <))
            anagrams[key, default: []].append(str)
        }

        return [[String]](anagrams.values)
    }
}