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

        while p1 < p2 {
            let c1 = alphanumeric[p1]
            let c2 = alphanumeric[p2]

            if c1.isLetter && c2.isLetter {
                if c1.lowercased() != c2.lowercased() { return false }
                p1 += 1
                p2 -= 1
            } else if c1.isNumber && c2.isNumber {
                if c1 != c2 { return false }
                p1 += 1
                p2 -= 1
            } else {
                if !c1.isLetter && !c1.isNumber { 
                    p1 += 1 
                } else if !c2.isLetter && !c2.isNumber { 
                    p2 -= 1 
                } else {
                    return false
                }
            }
        }

        return true
    }
}