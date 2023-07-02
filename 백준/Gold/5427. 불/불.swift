let t = Int(readLine()!)!

for _ in 0..<t {
    let wh = readLine()!.split(separator: " ").map{Int(String($0))!}
    let w = wh[0], h = wh[1]
    var map = (0..<h).map{_ in readLine()!.map{$0}}
    
    var queue = [(Int, Int)](), fire = [(Int, Int)]()
    var wall = 0
    var escape = false
    
    var fTime = [[Int]](repeating: [Int](repeating: -1, count: w), count: h)
    var time = [[Int]](repeating: [Int](repeating: -1, count: w), count: h)
    
    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == "@" {
                queue.append((i, j))
                time[i][j] = 0
            } else if map[i][j] == "#" {
                wall += 1
            } else if map[i][j] == "*" {
                fire.append((i, j))
                fTime[i][j] = 0
            }
        }
    }
    
    // fire
    var idx = 0
    while fire.count > idx {
        let cur = fire[idx]
        idx += 1
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (cur.0 + i.0, cur.1 + i.1)
            guard 0..<h ~= nx && 0..<w ~= ny else { continue }
            guard map[nx][ny] != "#" && fTime[nx][ny] == -1 else { continue }
            fTime[nx][ny] = fTime[cur.0][cur.1] + 1
            fire.append((nx, ny))
        }
    }
    
    // human
    idx = 0
    outer: while queue.count > idx {
        let cur = queue[idx]
        
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (cur.0 + i.0, cur.1 + i.1)
            guard 0..<h ~= nx && 0..<w ~= ny else { escape = true; break outer }
        }
        
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (cur.0 + i.0, cur.1 + i.1)
            guard map[nx][ny] != "#" && time[nx][ny] == -1 else { continue }
            guard time[cur.0][cur.1] + 1 < fTime[nx][ny] || fTime[nx][ny] == -1 else { continue }
            time[nx][ny] = time[cur.0][cur.1] + 1
            queue.append((nx, ny))
        }
        
        idx += 1
    }
    print(escape ? time[queue[idx].0][queue[idx].1]+1 : "IMPOSSIBLE")
}