let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]

var maze = (0..<n).map{_ in readLine()!.map{Int(String($0))!}}
var visit = [(0,0)]
while !visit.isEmpty {
    let pos = visit.removeFirst()
    for i in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
        let (nx,ny) = (pos.0 + i.0, pos.1 + i.1)
        guard 0..<n ~= nx && 0..<m ~= ny && maze[nx][ny] == 1 else { continue }
        maze[nx][ny] = maze[pos.0][pos.1] + 1
        visit.append((nx, ny))
    }
}
print(maze[n-1][m-1])