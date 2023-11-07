import Foundation

let t = Int(readLine()!)!
var str = ""

for _ in 0..<t {
    let n = readLine()!
    var A = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
    var B = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
    var cnt = 0
    
    for a in A {
        for b in B {
            guard a > b else { break }
            cnt += 1
        }
    }
    str += "\(cnt)\n"
}
print(str)