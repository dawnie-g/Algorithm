import Foundation

var cnt = [String:Double]()
var total: Double = 0
var str = ""

while let tree = readLine() {
    if tree.isEmpty { break }
    cnt[tree, default: 0] += 1
    total += 1
}

for tree in cnt.keys.sorted(by: <) {
    let distribution = (cnt[tree]! / total * 1000000.0).rounded() / 10000.0
    let formatted = String(format: "%.4f", distribution)
    str += "\(tree) \(formatted)\n"
}
print(str)