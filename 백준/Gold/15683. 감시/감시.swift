let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]
let room = (0..<n).map{_ in readLine()!.split(separator: " ").map{Int($0)!}} // 방의 초기 상태
var copy = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)

var cctv = [(Int, Int, Int)]() //(x, y, num)
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
var wall = 0
var ans = 0

for i in 0..<n {
    for j in 0..<m {
        if room[i][j] == 6 {
            wall += 1
        } else if room[i][j] == 0 {
            ans += 1
        } else {
            cctv.append((i, j, room[i][j]))
        }
    }
}

for dec in 0..<(1<<(2*cctv.count)) {
    for i in 0..<n {
        for j in 0..<m {
            copy[i][j] = room[i][j]
        }
    }
    var qua = dec
    for i in 0..<cctv.count {
        let dir = qua % 4
        qua /= 4
        let x = cctv[i].0
        let y = cctv[i].1
        switch cctv[i].2 {
        case 1:
            mark(x, y, dir)
        case 2:
            mark(x, y, dir)
            mark(x, y, dir+2)
        case 3:
            mark(x, y, dir)
            mark(x, y, dir+1)
        case 4:
            mark(x, y, dir)
            mark(x, y, dir+1)
            mark(x, y, dir+2)
        default:
            mark(x, y, dir)
            mark(x, y, dir+1)
            mark(x, y, dir+2)
            mark(x, y, dir+3)
        }
    }
    ans = min(ans, copy.flatMap{$0}.filter{$0 == 0}.count)
}

print(ans)

// 가시영역 표시
func mark(_ x: Int, _ y: Int, _ dir: Int) {
    var x = x
    var y = y
    while true {
        x += dx[dir % 4]
        y += dy[dir % 4]
        guard (0..<n) ~= x && (0..<m) ~= y && copy[x][y] != 6 else { return }
        guard copy[x][y] == 0 else { continue }
        copy[x][y] = 7 // 볼 수 있는 영역을 7로 표기
    }
}