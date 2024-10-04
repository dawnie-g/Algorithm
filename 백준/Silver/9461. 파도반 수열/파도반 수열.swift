let t = Int(readLine()!)!
var p = [0, 1, 1, 1, 2, 2]

for _ in 0..<t {
    let n = Int(readLine()!)!
    var i = p.count - 1
    while i < n {
        p.append(p[i] + p[i-4])
        i += 1
    }
    print(p[n])
}