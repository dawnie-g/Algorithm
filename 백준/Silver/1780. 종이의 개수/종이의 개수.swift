let n = Int(readLine()!)!
let arr = (0..<n).map{_ in readLine()!.split(separator: " ").map{Int(String($0))!}}
var ans = [Int](repeating: 0, count: 3) // -1, 0, 1

func paper(_ n: Int, _ r: Int, _ c: Int) {
    let num = arr[r][c]
    var same = true
    
    for i in r..<r+n {
        for j in c..<c+n {
            guard arr[i][j] == num else { same = false; break }
        }
    }
   
    if same {
        ans[num+1] += 1
        return // 해당 구간 탐색 종료
    }
    
    // 9개로 나눠서 재탐색
    for i in (0..<3).map({r + $0 * n/3}) {
        for j in (0..<3).map({c + $0 * n/3}) {
            paper(n/3, i, j)
        }
    }
}

paper(n, 0, 0)
for i in 0..<3 { [print(ans[i])] }