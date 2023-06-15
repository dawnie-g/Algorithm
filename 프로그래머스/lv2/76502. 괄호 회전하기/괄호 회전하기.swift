import Foundation

func solution(_ s:String) -> Int {
    guard s.count % 2 == 0 else { return 0 }
    var array = Array(s)
    var stack: [Character] = []
    var ans = 0
    
    for i in 0..<array.count {
        guard array[i] == "(" || array[i] == "[" || array[i] == "{" else {
            continue
        }
        stack.removeAll()
        stack.append(array[i])
        
        for c in (i > 0 ? array[i+1..<array.count] + array[0..<i] : array[1..<array.count]) {
            if c == "(" || c == "[" || c == "{" {
                stack.append(c)
            } else if (stack.last == "(" && c == ")") || (stack.last == "[" && c == "]") || stack.last == "{" && c == "}" {
                stack.removeLast()
            } else {
                stack.append("X")
                break
            } 
        }
        if stack.last != "X" { ans += 1 }
    }
    
    return ans
}