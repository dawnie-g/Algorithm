var input = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = ""
var isUsed = [Bool]()

while input != [0] {
    isUsed = [Bool](repeating: false, count: input[0]+1)
    backTracking(0, "", 0)
    print(ans)
    ans = ""
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
}

func backTracking(_ depth: Int, _ line: String, _ prev: Int) {
    if depth == 6 {
        ans += line + "\n"
        return
    }
    for i in 1..<input.count where !isUsed[i] && prev <= input[i] {
        isUsed[i] = true
        backTracking(depth+1, line + "\(input[i]) ", input[i])
        isUsed[i] = false
    }
}