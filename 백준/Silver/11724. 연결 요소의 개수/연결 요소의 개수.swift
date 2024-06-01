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

// 간선이 주어지지 않았을 뿐, 입력 받은 정점의 갯수를 고려하지 않아서 오답

let fIO = FileIO()
let n = fIO.readInt()
let m = fIO.readInt()
var graph = [Int: [Int]]()
var ans = 0

for _ in 0..<m {
    let u = fIO.readInt() - 1
    let v = fIO.readInt() - 1
    
    graph[u, default: []].append(v)
    graph[v, default: []].append(u)
}

var visited = [Bool](repeating: false, count: n)

for start in 0..<n where !visited[start] {
    var queue = [start]
    var head = 0
    var tail = 1
    ans += 1
    
    while head != tail {
        let vertex = queue[head]
        head += 1
        
        if !visited[vertex] {
            visited[vertex] = true
            
            if let neighbors = graph[vertex] {
                for neighbor in neighbors {
                    queue.append(neighbor)
                    tail += 1
                }
            }
        }
    }
}

print(ans)
