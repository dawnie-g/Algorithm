class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var str = String(num).map { String($0) }

        for i in 0..<str.count where str[i] == "6" {
            str[i] = "9"
            break
        }

        return Int(str.joined())!
    }
}