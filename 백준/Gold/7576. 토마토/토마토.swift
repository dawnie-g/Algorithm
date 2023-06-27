let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[1], m = nm[0]
var box = (0..<n).map{_ in readLine()!.split(separator: " ").map{Int(String($0))!}}

func bfs() -> Int {
    var visit = [(Int, Int)]()
    var empty = 0
    for i in 0..<n {
        for j in 0..<m {
            if box[i][j] == 1 {
                visit.append((i,j))
            } else if box[i][j] == -1 {
                empty += 1
            }
        }
    }
    
    var day = 0
    var idx = 0
    guard visit.count != n*m - empty else { return 0 }
    while visit.count > idx {
        let pos = visit[idx]
        idx += 1
        for i in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
            let (nx, ny) = (pos.0 + i.0, pos.1 + i.1)
            guard 0..<n ~= nx && 0..<m ~= ny && box[nx][ny] == 0 else { continue }
            box[nx][ny] = box[pos.0][pos.1] + 1
            visit.append((nx,ny))
            day = max(day, box[nx][ny])
        }
    }
    return n * m == idx + empty ? day - 1 : -1
}

print(bfs())