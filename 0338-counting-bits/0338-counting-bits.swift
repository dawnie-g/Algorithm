class Solution {
    func countBits(_ n: Int) -> [Int] {
        var ans: [Int] = []
        for i in 0...n {
            let bin = String(i, radix: 2)
            ans.append(bin.filter { $0 == "1" }.count)
        }
        return ans
    }
}