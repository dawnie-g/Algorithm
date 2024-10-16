class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var alphanumeric: [Character] = []
        var size = 0

        s.forEach {
            if $0.isLetter || $0.isNumber {
                alphanumeric.append($0)
                size += 1
            }
        }
        
        guard size > 0 else { return true }
            
        var p1 = 0
        var p2 = size - 1
        for i in 0..<(size / 2) {
            let c1 = alphanumeric[p1].lowercased()
            let c2 = alphanumeric[p2].lowercased()

            if c1 != c2 {
                return false
            }

            p1 += 1
            p2 -= 1
        }

        return true
    }
}