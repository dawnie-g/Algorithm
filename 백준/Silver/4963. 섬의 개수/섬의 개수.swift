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
var input = (fIO.readInt(), fIO.readInt())
let directions = [(0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (1, -1), (-1, 1), (-1, -1)]
var str = ""

while input != (0, 0) {
    let w = input.0
    let h = input.1
    var map = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
    var island = 0
    
    for i in 0..<h {
        for j in 0..<w {
            map[i][j] = fIO.readInt()
        }
    }
    
    // BFS
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    
    for i in 0..<h {
        for j in 0..<w where !visited[i][j] && map[i][j] == 1 {
            var queue = [(i, j)]
            var head = 0
            var tail = 1
            island += 1
            
            while head != tail {
                let curr = queue[head]
                head += 1
                visited[curr.0][curr.1] = true
                
                for (dx, dy) in directions {
                    let nx = curr.0 + dx
                    let ny = curr.1 + dy
                    
                    if 0..<h ~= nx && 0..<w ~= ny && !visited[nx][ny] && map[nx][ny] == 1 {
                        queue.append((nx, ny))
                        visited[nx][ny] = true
                        tail += 1
                    }
                }
            }
        }
    }
    
    str += "\(island)\n"
    input = (fIO.readInt(), fIO.readInt())
}

print(str)