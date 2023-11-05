import Foundation

let n = Int(readLine()!)!
var member = [[String]]()

for _ in 0..<n {
    member += [readLine()!.split(separator: " ").map{String($0)}]
}

member.sort { Int($0[0])! < Int($1[0])! }

for m in member {
    print(m[0], m[1])
}