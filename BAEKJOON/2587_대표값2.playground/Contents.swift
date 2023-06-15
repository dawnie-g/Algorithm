var n = [Int]()

for _ in 1...5 {
    n.append(Int(readLine()!)!)
}

print(n.reduce(0, +)/5)
print(n.sorted()[2])
