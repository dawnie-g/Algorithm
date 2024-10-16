class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var alphanumeric: [Character] = []

        s.forEach {
            if $0.isLetter || $0.isNumber {
                alphanumeric.append($0)
            }
        }

        let size = alphanumeric.count
        
        guard size > 0 else { return true }
            
        var p1 = 0
        var p2 = size - 1
        for i in 0..<(size / 2) {
            let c1 = alphanumeric[p1 + i].lowercased()
            let c2 = alphanumeric[p2 - i].lowercased()

            if c1 != c2 {
                return false
            }
        }

        return true
    }
}