let n = Int(readLine()!)!
var ropes = [Int]()
var maxWeight = 0

for _ in 0..<n {
    ropes.append(Int(readLine()!)!)
}
ropes.sort()

for i in 0..<n {
    maxWeight = max(ropes[i] * (n-i), maxWeight)
}

print(maxWeight)