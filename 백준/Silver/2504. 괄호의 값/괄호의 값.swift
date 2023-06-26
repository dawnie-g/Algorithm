let ps = readLine()!
var stack = [Character]()
var prev: Character = "_"
var times = 1
var ans = 0

outer: for p in ps {
    switch p {
    case "(", "[" : 
        stack.append(p)
        times *= p == "(" ? 2 : 3
    case ")", "]" :
        guard !stack.isEmpty else { ans = 0; break outer }
        if stack.last == "(" && p == ")" {
            stack.removeLast()
            if prev == "(" { ans += times }
        } else if stack.last == "[" && p == "]" {
            stack.removeLast()
            if prev == "[" { ans += times }
        } else { ans = 0; break }
        
        times /= (p == ")" ? 2 : 3)
    default : ans = 0; break outer
    }
    prev = p
}

print(stack.isEmpty ? ans : 0)