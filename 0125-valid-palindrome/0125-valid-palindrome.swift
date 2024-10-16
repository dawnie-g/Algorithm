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

        for i in 0..<(size / 2) {
            var c1 = alphanumeric[i]
            var c2 = alphanumeric[size - 1 - i]

            if c1.isLetter && c2.isLetter {
                if c1.lowercased() != c2.lowercased() { 
                    return false
                }
            } else if c1 != c2 {
                return false
            }
        }

        return true
    }
}