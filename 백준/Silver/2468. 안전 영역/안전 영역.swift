import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fIO = FileIO()
let n = fIO.readInt()
var heights = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
let visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var minH = Int.max
var maxH = Int.min
var currMinH = Int.max
var noZeroCnt = n*n
var ans = 0

for i in 0..<n {
    for j in 0..<n {
        let d = fIO.readInt()
        heights[i][j] = d
        minH = min(minH, d)
        maxH = max(maxH, d)
    }
}

while noZeroCnt > 0 {
    if minH == maxH {
        ans = 1
        break
    }
    
    var currVisited = visited
    currMinH = Int.max
    
    for i in 0..<n {
        for j in 0..<n {
            let h = heights[i][j] - minH
            if h > 0 {
                heights[i][j] = h
                currMinH = min(currMinH, h)
            } else if heights[i][j] > 0 {
                noZeroCnt -= 1
                heights[i][j] = 0
            }
        }
    }
    
    var count = 0
    
    for i in 0..<n {
        for j in 0..<n {
            guard !currVisited[i][j] && heights[i][j] != 0 else { continue }
            currVisited = bfs(i, j, currVisited)
            count += 1
        }
    }
    
    ans = max(ans, count)
    minH = currMinH
}

print(ans)

func bfs(_ r: Int, _ c: Int, _ visited: [[Bool]]) -> [[Bool]] {
    
    var visited = visited
    var queue = [(r,c)]
    var idx = 0
    
    while queue.count > idx {
        let curr = queue[idx]
        idx += 1
        for i in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let (nx, ny) = (curr.0 + i.0, curr.1 + i.1)
            guard 0..<n ~= nx && 0..<n ~= ny && visited[nx][ny] == false && heights[nx][ny] != 0 else { continue }
            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }
    
    return visited
}
