let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let num = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
let n = nm[0], m = nm[1]

var remain = [Int](repeating: 0, count: 10_001)
for i in num {
    remain[i] += 1
}
var str = ""

func backTracking(_ k: Int, _ line: [Int]) {
    if k == m {
        str += line.map{String($0)}.joined(separator: " ")
        str += "\n"
        return
    }
    for i in 0..<n where remain[num[i]] > 0 {
        guard i == 0 || (i > 0 && num[i-1] != num[i]) else { continue }
        guard line.isEmpty || (!line.isEmpty && line.last! <= num[i]) else { continue }
        remain[num[i]] -= 1
        backTracking(k+1, line + [num[i]])
        remain[num[i]] += 1
    }
}
backTracking(0, [])
print(str)