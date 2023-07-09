let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let num = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
let n = nm[0], m = nm[1]

var str = ""

func backTracking(_ k: Int, _ line: String, _ prev: Int) {
    if k == m {
        str += line + "\n"
        return
    }
    for i in 0..<n {
        guard i == 0 || (i > 0 && num[i-1] != num[i]) else { continue }
        guard prev <= num[i] else { continue }
        backTracking(k+1, line + "\(num[i]) ", num[i])
    }
}
backTracking(0, "", 0)
print(str)