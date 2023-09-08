let n = Int(readLine()!)!
let times = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)

print((0..<n).map{times[$0]*($0+1)}.reduce(0, +))