let n = readLine()!.split(separator: " ").map{Int($0)!}.sorted()

print(n[0] == n[1] ? 0 : n[1]-n[0]-1)
if n[1]-n[0]-1 > 0 {
    print((1...n[1]-n[0]-1).map{String(n[0] + $0)}.joined(separator: " "))
}
