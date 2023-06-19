let n = Int(readLine()!)!
for _ in 1...n {
    let line = readLine()!.split(separator: " ").map{$0.sorted()}
    print(line[0] == line[1] ? "Possible" : "Impossible")
}