class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for token in tokens {
            if let number = Int(token) { 
                stack.append(number)
            } else {
                let second = stack.removeLast()
                let first = stack.removeLast()
                switch token {
                    case "+": stack.append(first + second)
                    case "-": stack.append(first - second)
                    case "*": stack.append(first * second)
                    case "/": stack.append(first / second)
                    default: break
                }
            }
            print(stack)
        }

        return stack.last!
    }
}