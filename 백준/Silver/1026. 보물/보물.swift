let n = Int(readLine()!)
var A = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
var B = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
var ans = 0

for (a, b) in zip(A, B) {
    ans += a * b
}

print(ans)