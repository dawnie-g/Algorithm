let ns = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = ns[0], s = ns[1]

var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = 0

func backTracking(_ cur: Int, _ sum: Int) {
    if cur == n {
        if sum == s {
            cnt += 1 }
        return
    }
    backTracking(cur+1, sum) // 추가하지 않는 경우
    backTracking(cur+1, sum + arr[cur])
}

backTracking(0, 0)
if s == 0 { cnt -= 1 }
print(cnt)
