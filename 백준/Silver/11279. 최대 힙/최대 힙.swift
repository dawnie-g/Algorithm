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
    let input = fIO.readInt()
    
    if input == 0 {
        let output = extractMax()
        str += "\(output)\n"
    } else {
        insert(input)
    }
}
print(str)

func insert(_ value: Int) {
    heap.append(value)
    cnt += 1
    heapifyUp(cnt - 1)
}

func heapifyUp(_ index: Int) {
    var childIndex = index
    let childValue = heap[childIndex]
    var parentIndex = (childIndex - 1) / 2
    
    while childIndex > 0 && childValue > heap[parentIndex] {
        heap[childIndex] = heap[parentIndex]
        childIndex = parentIndex
        parentIndex = (childIndex - 1) / 2
    }
    heap[childIndex] = childValue
}

func heapifyDown(_ index: Int) {
    var parentIndex = index
    let parentValue = heap[parentIndex]
    
    while true {
        let leftChildIndex = parentIndex * 2 + 1
        let rightChildIndex = parentIndex * 2 + 2
        var maxIndex = parentIndex
        
        if leftChildIndex < cnt && heap[leftChildIndex] > heap[maxIndex] {
            maxIndex = leftChildIndex
        }
        if rightChildIndex < cnt && heap[rightChildIndex] > heap[maxIndex] {
            maxIndex = rightChildIndex
        }
        if maxIndex == parentIndex {
            break
        }
        heap[parentIndex] = heap[maxIndex]
        heap[maxIndex] = parentValue
        parentIndex = maxIndex
    }
    heap[parentIndex] = parentValue
}

func extractMax() -> Int {
    guard !heap.isEmpty else { return 0 }
    
    cnt -= 1
    if heap.count == 1 {
        return heap.removeFirst()
    } else {
        let maxValue = heap[0]
        heap[0] = heap.removeLast()
        heapifyDown(0)
        return maxValue
    }
}