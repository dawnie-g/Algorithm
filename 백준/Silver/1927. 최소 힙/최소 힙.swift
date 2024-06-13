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
var heap = [Int]()
var cnt = 0

var str = ""
for _ in 0..<n {
    let value = fIO.readInt()
    if value == 0 {
        let min = extractMin()
        str += "\(min)\n"
    } else {
        insert(value)
    }
}
print(str)

func insert(_ value: Int) {
    heap.append(value)
    cnt += 1
    heapifyUp(cnt - 1)
}

// 최소 힙 상향
func heapifyUp(_ index: Int) {
    var childIndex = index
    let childValue = heap[childIndex]
    var parentIndex = (childIndex - 1) / 2
    
    while childIndex > 0 && childValue < heap[parentIndex] {
        heap[childIndex] = heap[parentIndex]
        childIndex = parentIndex
        parentIndex = (childIndex - 1) / 2
    }
    heap[childIndex] = childValue
}

func extractMin() -> Int {
    if heap.isEmpty {
        return 0
    } else if heap.count == 1 {
        cnt -= 1
        return heap.removeFirst()
    } else {
        let minValue = heap[0]
        heap[0] = heap.removeLast()
        cnt -= 1
        heapifyDown(0)
        return minValue
    }
}

// 최소 힙 하향
func heapifyDown(_ index: Int) {
    var parentIndex = index
    let parentValue = heap[parentIndex]
    let count = heap.count
    
    while true {
        let leftChildIndex = parentIndex * 2 + 1
        let rightChildIndex = parentIndex * 2 + 2
        var minIndex = parentIndex
        
        if leftChildIndex < count && heap[leftChildIndex] < heap[minIndex] {
            minIndex = leftChildIndex
        }
        if rightChildIndex < count && heap[rightChildIndex] < heap[minIndex] {
            minIndex = rightChildIndex
        }
        if minIndex == parentIndex {
            break
        }
        heap[parentIndex] = heap[minIndex]
        heap[minIndex] = parentValue
        parentIndex = minIndex
    }
    heap[parentIndex] = parentValue
}