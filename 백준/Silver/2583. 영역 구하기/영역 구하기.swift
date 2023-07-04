let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0], n = input[1], k = input[2]

var paper = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
var vis = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
var ans = [Int]()

for _ in 0..<k {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    for r in line[1]..<line[3] {
        for c in line[0]..<line[2] {
            paper[r][c] = 1
            vis[r][c] = true
        }
    }
}

for i in 0..<m {
    for j in 0..<n {
        if vis[i][j] == false {
            ans.append(bfs(r:i, c:j))
        }
    }
}

print(ans.count)
print(ans.sorted().map{String($0)}.joined(separator: " "))

func bfs(r: Int, c: Int) -> Int {
    var queue = [(r, c)], idx = 0
    paper[r][c] = 0; vis[r][c] = true
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (ny, nx) = (cur.0 + i.0, cur.1 + i.1)
            guard 0..<n ~= nx && 0..<m ~= ny else { continue }
            guard paper[ny][nx] == -1 && vis[ny][nx] == false else { continue }
            vis[ny][nx] = true
            paper[ny][nx] = 0
            queue.append((ny, nx))
        }
    }
    return idx
}