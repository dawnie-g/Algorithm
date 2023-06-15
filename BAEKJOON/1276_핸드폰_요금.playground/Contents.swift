let n = Int(readLine()!)!
let call = readLine()!.split(separator: " ").map{Int($0)!}

let Y = (0..<n).map{call[$0] > 29 ? (call[$0] / 30 + 1) * 10 : 10}.reduce(0, +)
let M = (0..<n).map{call[$0] > 59 ? (call[$0] / 60 + 1) * 15 : 15}.reduce(0, +)

print(Y == M ? "Y M \(Y)" : Y < M ? "Y \(Y)" : "M \(M)" )
