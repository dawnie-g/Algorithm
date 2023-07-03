let n = Int(readLine()!)!
let arr = (0..<n).map{_ in readLine()!.map{$0}}
var ans = ""

func quadTree(_ n: Int, _ r: Int, _ c: Int) {
    let num = arr[r][c]
    var same = true
    
    for i in r..<r+n {
        for j in c..<c+n {
            guard num == arr[i][j] else { same = false; break }
        }
    }
    
    if same {
        ans.append(num)
        return
    }
    
    ans += "("
    for i in (0..<2).map({r + $0 * n/2}) {
        for j in (0..<2).map({c + $0 * n/2}) {
            quadTree(n/2, i, j)
        }
    }
    ans += ")"
}

quadTree(n, 0, 0)
print(ans)