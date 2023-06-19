let line1 = readLine()!.map{Int($0.asciiValue!)}
let line2 = readLine()!.map{Int($0.asciiValue!)}

var cnt1 = [Int](repeating: 0, count: 200)
var cnt2 = [Int](repeating: 0, count: 200)

line1.forEach { cnt1[$0] += 1 }
line2.forEach { cnt2[$0] += 1 }

var ans = 0
for i in 0..<200 {
    ans += abs(cnt1[i] - cnt2[i])
}

print(ans)