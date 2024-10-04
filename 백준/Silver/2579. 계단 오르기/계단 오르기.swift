let n = Int(readLine()!)!
let scores = [0] + (0..<n).map { _ in Int(readLine()!)! }
var dp = [Int](repeating: 0, count: n + 1)

if n == 1 {
    print(scores[1])
} else if n == 2 {
    print(scores[1] + scores[2])
} else {
    dp[1] = scores[1]
    dp[2] = scores[1] + scores[2]
    
    for i in 3...n {
        dp[i] = max(dp[i-2], dp[i-3] + scores[i-1]) + scores[i]
    }
    
    print(dp[n])
}