class Solution {
    func reverseString(_ s: inout [Character]) {
        recursion(&s, 0, s.count)
    }

    private func recursion(_ s: inout [Character], _ index: Int, _ len: Int) {
        if index >= len / 2 { 
            return 
        }
        recursion(&s, index + 1, len)
        let temp = s[len - index - 1]
        s[len - index - 1] = s[index]
        s[index] = temp
    }
}