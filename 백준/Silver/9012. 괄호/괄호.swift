let n = Int(readLine()!)!

outer: for _ in 0..<n {
    let ps = readLine()!
    var stack = [Character]()
    for p in ps {
        if p == "(" {
            stack.append(p)
        } else {
            guard !stack.isEmpty else { print("NO"); continue outer }
            stack.removeLast()
        }
    }
    print(stack.isEmpty ? "YES" : "NO")
}