class Solution {
    func largestGoodInteger(_ num: String) -> String {
        var str: ArraySlice<String> = []
        var num = num.map { String($0) }
        for i in 0..<num.count-2 {
            let sub = num[i...i+2]

            if sub.allSatisfy({ sub.first! == $0 }) && sub.first! > str.first ?? "-1" {
                str = sub
            }
        }
        return str.joined(separator: "")
    }
}