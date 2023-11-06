import Foundation

let n = Int(readLine()!)!
var serial = [String](repeating: "", count: n)
var str = ""

for i in 0..<n {
    serial[i] = readLine()!
}
serial.sort {
    let cntA = $0.count
    let cntB = $1.count
    let sumA = $0.filter{$0.isNumber}.reduce(0, { Int(String($0))! + Int(String($1))! })
    let sumB = $1.filter{$0.isNumber}.reduce(0, { Int(String($0))! + Int(String($1))! })
    
    if cntA == cntB && sumA == sumB {
        return $0 < $1
    } else if cntA == cntB {
        return sumA < sumB
    } else {
        return cntA < cntB
    }
}

for s in serial {
    str += "\(s)\n"
}
print(str)