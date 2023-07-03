let n = Int(readLine()!)!
let arr = (0..<n).map{_ in readLine()!.split(separator: " ").map{Int(String($0))!}}
var wb = [0, 0] // white blue

func paper(_ n: Int, _ r: Int, _ c: Int) {
    let color = arr[r][c]
    var oneColor = true
    
    for i in r..<r+n {
        for j in c..<c+n {
            guard color == arr[i][j] else { oneColor = false; break }
        }
    }
    
    if oneColor {
        wb[color] += 1
        return // 해당 영역 탐색 종료
    }
    
    // 여러 색으로 구성되어 있으면 4분할하여 소영역 탐색
    for i in (0..<2).map({r + $0 * n/2}) {
        for j in (0..<2).map({c + $0 * n/2}) {
            paper(n/2, i, j)
        }
    }
}

paper(n, 0, 0)
print(wb[0])
print(wb[1])
