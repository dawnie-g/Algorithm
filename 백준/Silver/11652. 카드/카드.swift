import Foundation

enum FileIO {

    @inline(__always) static var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0

    @inline(__always) private static func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }

    @inline(__always) static func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
}

let n = FileIO.readInt()
var arr = [Int](repeating: 0, count: n)
var maxCount = 0
var card = Int.max

for i in 0..<n {
    arr[i] = FileIO.readInt()
}

let dic = Dictionary(grouping: arr) {$0}

for i in dic where maxCount < i.value.count || (maxCount == i.value.count && i.key < card) {
    card = i.key
    maxCount = i.value.count
}
print(card)