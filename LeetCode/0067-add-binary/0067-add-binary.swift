class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = a.reversed().map { String($0) }
        var b = b.reversed().map { String($0) }
        let countDiff = a.count - b.count
        if countDiff > 0 {
            b += [String](repeating: "0", count: countDiff)
        } else {
            a += [String](repeating: "0", count: -countDiff)
        }

        var carry = 0
        var ans = ""

        for i in 0..<a.count {
            let num1 = Int(a[i])!
            let num2 = Int(b[i])!

            let sum = num1 + num2 + carry
            carry = sum > 1 ? 1 : 0
            ans.append("\(sum % 2)")
        }

        ans += carry == 1 ? "1" : ""

        return String(ans.reversed())
    }
}