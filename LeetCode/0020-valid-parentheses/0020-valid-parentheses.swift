class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()

        for c in s {
            switch c {
                case "(", "{", "[":
                stack.append(c)
                default:
                guard !stack.isEmpty else { return false }
                let pair1 = c == ")" && stack.last! == "("
                let pair2 = c == "}" && stack.last! == "{"
                let pair3 = c == "]" && stack.last! == "["
                if pair1 || pair2 || pair3 {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }

        return stack.isEmpty
    }
}