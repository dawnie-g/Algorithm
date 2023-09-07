let n = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var B = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
var ans = 0

for i in 0..<n {
    ans += A[i] * B[i]
}

print(ans)