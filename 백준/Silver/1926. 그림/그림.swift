let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]

// BFS
var vis = [[Bool]](repeating: [Bool](repeating: false,count: m), count: n)
var queue = [[Int]]()
var dx = [1, 0, -1, 0], dy = [0, 1, 0, -1]
var paper = [[Int]]()
for _ in 0..<n {
    paper.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

// ans
var num = 0
var mx = 0

for i in 0..<n {
    for j in 0..<m {
        guard paper[i][j] == 1 && !vis[i][j] else { continue } // start point
        num += 1
        queue.append([i,j])
        vis[i][j] = true
        var count = 0
        while !queue.isEmpty {
            count += 1
            let cur = queue.removeFirst()
            for idx in 0..<4 {
                var nx = cur[0] + dx[idx]
                var ny = cur[1] + dy[idx]
                guard nx >= 0 && nx < n && ny >= 0 && ny < m else { continue }
                guard !vis[nx][ny] && paper[nx][ny] == 1 else { continue }
                vis[nx][ny] = true
                queue.append([nx, ny])
            }
        }
        mx = max(mx, count)
    }
}
print(num)
print(mx)