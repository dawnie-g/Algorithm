let n = Int(readLine()!)!
var map = (0..<n).map{_ in readLine()!.map{Int(String($0))!}}

var ans = [Int]()

for i in 0..<n {
    for j in 0..<n {
        guard map[i][j] > 0 else { continue }
        ans.append(bfs(i, j))
    }
}

bfs(0, 0)
ans.sort()
print(ans.count)
ans.forEach { print($0) }

func bfs(_ r: Int, _ c: Int) -> Int {
    var queue = [(r, c)]
    var idx = 0
    var cnt = 0
    
    map[r][c] = -1 // -1 means visited
    cnt += 1
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (cur.0 + i.0, cur.1 + i.1)
            guard 0..<n ~= nx && 0..<n ~= ny && map[nx][ny] != -1 else { continue }
            if map[nx][ny] == 1 {
                queue.append((nx, ny))
                cnt += 1
            }
            map[nx][ny] = -1
        }
    }
    return cnt
}