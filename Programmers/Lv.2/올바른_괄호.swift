import Foundation

func solution(_ s:String) -> Bool
{
    var stack: [Character] = []
    
    for c in s {
        if c == "(" {
            stack.append(c)
        } else {
            if stack.isEmpty {return false}
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}