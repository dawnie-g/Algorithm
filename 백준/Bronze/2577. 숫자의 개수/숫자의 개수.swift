var result = 1

for _ in 1...3 {
    result *= Int(readLine()!)!
}

for i in 0...9 {
    print(String(result).filter{String($0) == String(i)}.count)
}