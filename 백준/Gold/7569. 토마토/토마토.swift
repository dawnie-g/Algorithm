let mnh = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = mnh[0], n = mnh[1], h = mnh[2]

var box = (0..<h).map{_ in (0..<n).map{_ in readLine()!.split(separator: " ").map{Int(String($0))!}}}
var ripe = [(Int, Int, Int)]()
var empty = 0

for i in (0..<h) {
    for j in (0..<n) {
        for k in (0..<m) {
            if box[i][j][k] == 1 {
                ripe.append((i, j, k))
            } else if box[i][j][k] == -1 {
                empty += 1
            }
        }
    }
}

print(tomato(ripe))

func tomato(_ ripe: [(Int, Int, Int)]) -> Int {
    guard ripe.count + empty < n * m * h else { return 0 }
    
    var queue = ripe
    var idx = 0
    var day = 0
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        for i in [(1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)] {
            let (nz, nx, ny) = (cur.0 + i.0, cur.1 + i.1, cur.2 + i.2)
            guard (0..<h) ~= nz && (0..<n) ~= nx && (0..<m) ~= ny && box[nz][nx][ny] == 0 else { continue }
            box[nz][nx][ny] = box[cur.0][cur.1][cur.2] + 1
            day = max(day, box[nz][nx][ny])
            queue.append((nz, nx, ny))
        }
    }
    
    return empty + idx == n * m * h ? day-1 : -1
}