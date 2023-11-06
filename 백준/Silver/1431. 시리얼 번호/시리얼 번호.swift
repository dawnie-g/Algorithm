import Foundation

let n = Int(readLine()!)!
var serial = Array(repeating: ("", 0, 0), count: n)
var str = ""

for i in 0..<n {
    let line = readLine()!
    serial[i] = (line, line.count, line.reduce(0, { (Int(String($0)) ?? 0) + (Int(String($1)) ?? 0 )} ))
}
serial.sort {
    if $0.1 == $1.1 && $0.2 == $1.2 {
        return $0 < $1
    } else if $0.1 == $1.1 {
        return $0.2 < $1.2
    } else {
        return $0.1 < $1.1
    }
}

for s in serial {
    str += "\(s.0)\n"
}
print(str)