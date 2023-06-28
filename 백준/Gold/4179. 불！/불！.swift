let rc = readLine()!.split(separator: " ").map{Int(String($0))!}
let r = rc[0], c = rc[1]
var maze: [[String]] = (0..<r).map{_ in readLine()!.map{String($0)}}

var JTime = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
var FTime = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)

func fire() -> String {
    var JQ = [(Int, Int)]()
    var FQ = [(Int, Int)]()

    for i in 0..<r {
        for j in 0..<c {
            switch maze[i][j] {
            case "J": JQ.append((i, j)); JTime[i][j] = 1
            case "F": FQ.append((i, j)); FTime[i][j] = 1
            default: continue
            }
        }
    }
    var JIdx = 0, FIdx = 0
    
    // Fire
    while FQ.count > FIdx {
        let pos = FQ[FIdx]
        FIdx += 1
        for i in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
            let (nx, ny) = (pos.0 + i.0, pos.1 + i.1)
            guard (0..<r) ~= nx && (0..<c) ~= ny && FTime[nx][ny] == 0 && maze[nx][ny] != "#" else { continue }
            FTime[nx][ny] = FTime[pos.0][pos.1] + 1
            FQ.append((nx, ny))
        }
    }
    // Jihoon
    while JQ.count > JIdx {
        let pos = JQ[JIdx]
        JIdx += 1
        for i in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
            let (nx, ny) = (pos.0 + i.0, pos.1 + i.1)
            guard (0..<r) ~= nx && (0..<c) ~= ny else { return "\(JTime[pos.0][pos.1])" } // escape
            guard JTime[nx][ny] == 0 && maze[nx][ny] != "#" else { continue }
            guard JTime[pos.0][pos.1]+1 < FTime[nx][ny] || FTime[nx][ny] == 0 else { continue }
            JTime[nx][ny] = JTime[pos.0][pos.1] + 1
            JQ.append((nx, ny))
        }
    }
    return "IMPOSSIBLE"
}

print(fire())