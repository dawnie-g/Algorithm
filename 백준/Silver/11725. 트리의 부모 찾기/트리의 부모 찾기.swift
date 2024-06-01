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
var tree = [[Int]](repeating: [], count: n + 1)
var parent = [Int](repeating: 0, count: n + 1)

for _ in 0..<n-1 {
    let node1 = fIO.readInt()
    let node2 = fIO.readInt()
    
    tree[node1].append(node2)
    tree[node2].append(node1)
}

var visited = [Bool](repeating: false, count: n + 1)
var queue = [Int](repeating: 0, count: n)
queue[0] = 1
var head = 0
var tail = 1

while head != tail {
    let node = queue[head]
    head += 1
    visited[node] = true
    
    for child in tree[node] where !visited[child] {
        queue[tail] = child
        tail += 1
        parent[child] = node
    }
}

var ans = ""
for i in 2...n {
    ans += "\(parent[i])\n"
}
print(ans)
