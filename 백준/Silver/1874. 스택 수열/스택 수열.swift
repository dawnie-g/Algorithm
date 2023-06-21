func sequence(n: Int) -> String {
    var target = Int(readLine()!)!
    var stack = [Int]()
    var result = ""
    
    for i in 1...n {
        if stack.isEmpty || target > stack.last! {
            stack.append(i)
            result.append("+")
            while !stack.isEmpty && target == stack.last! {
                stack.removeLast()
                result.append("-")
                target = Int(readLine() ?? "0")!
            }
        }
        if !stack.isEmpty && i == n {
            if target != stack.last! {
                return "NO"
            }
        }
    }
    return result
}

let string = sequence(n: Int(readLine()!)!)
if string == "NO" {
    print("NO")
} else {
    for c in string {
        print(c)
    }
}