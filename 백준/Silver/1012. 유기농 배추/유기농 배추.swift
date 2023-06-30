let t = Int(readLine()!)!
var cbg = [[Int]]()
var m = 0, n = 0, k = 0

for _ in 0..<t {
    let mnk = readLine()!.split(separator: " ").map{Int(String($0))!}
    m = mnk[0]
    n = mnk[1]
    k = mnk[2]
    
    cbg = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    for _ in 0..<k {
        let loc = readLine()!.split(separator: " ").map{Int(String($0))!}
        cbg[loc[1]][loc[0]] = 1
    }
    
    var ans = 0
    for i in 0..<n {
        for j in 0..<m {
            guard cbg[i][j] == 1 else { continue }
            bfs(i, j)
            ans += 1
        }
    }
    
    print(ans)
}

func bfs(_ r: Int, _ c: Int) {
    var queue = [(r, c)]
    var idx = 0
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (cur.0 + i.0, cur.1 + i.1)
            guard 0..<n ~= nx && 0..<m ~= ny && cbg[nx][ny] == 1 else { continue }
            cbg[nx][ny] = 0
            queue.append((nx, ny))
        }
    }
}