import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack = [String]()
    var cnt = k
    
    for n in number {
        let n = String(n)
        
        if stack.isEmpty {
            stack.append(n)
            continue
        }
        
        while !stack.isEmpty && stack.last! < n && cnt > 0 {
            stack.removeLast()
            cnt -= 1
        }
        stack.append(n)
    }
    
    while cnt > 0 {
        stack.removeLast()
        cnt -= 1
    }
    
    return stack.joined()
}