import Foundation

let t = Int(readLine()!)!
var str = ""

for _ in 0..<t {
    let n = readLine()!
    let A = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
    let B = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
    let sizeB = B.count
    var cntB = B.count
    var idxB = 0
    var cnt = 0
    
    for a in A {
        while idxB < sizeB {
            if a > B[idxB] {
                cnt += cntB
                break
            } else {
                idxB += 1
                cntB -= 1
            }
        }
    }
    str += "\(cnt)\n"
}
print(str)