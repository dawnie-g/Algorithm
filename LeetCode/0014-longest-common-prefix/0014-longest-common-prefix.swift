class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var common = strs[0]

        str: for i in 1..<strs.count {
            while !common.isEmpty {
                if strs[i].hasPrefix(common) { continue str }
                common.removeLast()
            }
        }

        return common
    }
}