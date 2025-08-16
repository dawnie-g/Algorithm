class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var str = String(num)

        if let index = str.firstIndex(of: "6") {
            str.replaceSubrange(index...index, with: "9")
        }

        return Int(str)!
    }
}