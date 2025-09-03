class Solution {
    func reverseString(_ s: inout [Character]) {
        recursion(&s, 0, s.count - 1)
    }

    private func recursion(_ s: inout [Character], _ head: Int, _ tail: Int) {
        if head >= tail { 
            return 
        }
        recursion(&s, head + 1, tail - 1)
        let temp = s[head]
        s[head] = s[tail]
        s[tail] = temp
    }
}