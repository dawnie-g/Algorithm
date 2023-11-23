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

let fileIO = FileIO()
let n = fileIO.readInt()
let card = (0..<n).map{_ in fileIO.readInt()}.sorted()
let m = fileIO.readInt()
let finding = (0..<m).map{_ in fileIO.readInt()}
var str = ""

find: for num in finding {
    if !str.isEmpty {
        str += " "
    }
    str += "\(maxIdx(target: num) - minIdx(target: num))"
}
print(str)

func minIdx(target: Int) -> Int {
    var st = 0
    var en = n
    
    while st < en {
        var mid = (st + en) / 2
        if card[mid] >= target {
            en = mid
        } else  {
            st = mid + 1
        }
    }
    return st
}

func maxIdx(target: Int) -> Int {
    var st = 0
    var en = n
    
    while st < en {
        var mid = (st + en) / 2
        if card[mid] > target {
            en = mid
        } else  {
            st = mid + 1
        }
    }
    return st
}