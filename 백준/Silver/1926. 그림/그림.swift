let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]
var ans = [Int]()
var paper = [[Int]]()

for _ in 0..<n {
    paper.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 0..<n {
    for j in 0..<m {
        guard paper[i][j] == 1 else { continue }
        ans.append(bfs(i,j))
    }
}

print(ans.count)
print(ans.max() ?? 0)

func bfs(_ r: Int, _ c: Int) -> Int {
    let dx = [1, 0, -1, 0], dy = [0, 1, 0, -1]
    var queue = [(r,c)]
    paper[r][c] = 0
    var idx = 0
    
    while queue.count > idx {
        let (x,y) = queue[idx]
        idx += 1
        for i in 0..<4 {
            let (nx, ny) = (x + dx[i], y + dy[i])
            guard nx < n && ny < m && nx >= 0 && ny >= 0 && paper[nx][ny] == 1 else { continue }
            paper[nx][ny] = 0
            queue.append((nx, ny))
        }
    }
    return queue.count
}