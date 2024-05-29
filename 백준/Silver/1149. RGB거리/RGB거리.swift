let n = Int(readLine()!)!
var dp = [[Int]]()

for _ in 0..<n {
    let next = readLine()!.split(separator: " ").map { Int($0)! }
    dp.append(next)
}

for i in 1..<n {
    dp[i][0] += min(dp[i-1][1], dp[i-1][2])
    dp[i][1] += min(dp[i-1][0], dp[i-1][2])
    dp[i][2] += min(dp[i-1][0], dp[i-1][1])
}

let result = min(dp[n-1][0], dp[n-1][1], dp[n-1][2])
print(result)