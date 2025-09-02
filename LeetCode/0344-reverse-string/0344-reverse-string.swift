class Solution {
    func reverseString(_ s: inout [Character]) {
        var head = 0
        var tail = s.count - 1

        while head < tail {
            let temp = s[head]
            s[head] = s[tail]
            s[tail] = temp

            head += 1
            tail -= 1
        }
    }
}