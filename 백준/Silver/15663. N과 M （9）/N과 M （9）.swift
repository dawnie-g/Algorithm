let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let num = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
let n = nm[0], m = nm[1]

var issued = [Int](repeating: 0, count: 10_000)
for i in num {
    issued[i] += 1
}
var str = ""

func backTracking(_ k: Int, _ line: String) {
    if k == m {
        str += line + "\n"
        return
    }
    for i in 0..<n where issued[num[i]] > 0 {
        guard i == 0 || (i > 0 && num[i-1] != num[i]) else { continue }
        issued[num[i]] -= 1
        backTracking(k+1, line + "\(num[i]) ")
        issued[num[i]] += 1
    }
}
backTracking(0, "")
print(str)