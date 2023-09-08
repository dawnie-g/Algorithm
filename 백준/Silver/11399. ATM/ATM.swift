let n = Int(readLine()!)!
var times = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
times = (0..<n).map{times[$0]*($0+1)}

print(times.reduce(0, +))