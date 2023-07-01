let n = Int(readLine()!)!
var pic = [[Character]]()
var R = 0, G = 0, B = 0, RG = 0

for _ in 0..<n {
    let line = readLine()!
    pic.append(line.map{$0})
}

for i in 0..<n {
    for j in 0..<n {
        if pic[i][j] == "R" {
            bfs(i, j, "R")
            R += 1
        } else if pic[i][j] == "G" {
            bfs(i, j, "G")
            G += 1
        } else if pic[i][j] == "B" {
            bfs(i, j, "B")
            B += 1
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        guard pic[i][j] == "_" else { continue }
        bfs_cw(i, j, "_")
        RG += 1
    }
}

func bfs(_ r: Int, _ c: Int, _ letter: Character) {
    var queue = [(r, c)]
    var idx = 0
    pic[r][c] = letter == "B" ? "." : "_"
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (cur.0 + i.0, cur.1 + i.1)
            guard 0..<n ~= nx && 0..<n ~= ny && pic[nx][ny] == letter else { continue }
            pic[nx][ny] = pic[nx][ny] == "B" ? "." : "_"
            queue.append((nx, ny))
        }
    }
}

func bfs_cw(_ r: Int, _ c: Int, _ letter: Character) {
    var queue = [(r, c)]
    var idx = 0
    pic[r][c] = "."
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (cur.0 + i.0, cur.1 + i.1)
            guard 0..<n ~= nx && 0..<n ~= ny && pic[nx][ny] == "_" else { continue }
            pic[nx][ny] = "."
            queue.append((nx, ny))
        }
    }
}

print(R+G+B, RG+B)