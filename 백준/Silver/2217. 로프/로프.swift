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
var ropes = [Int]()
var maxWeight = 0

for _ in 0..<n {
    ropes.append(FileIO.readInt())
}
ropes.sort()

for i in 0..<n {
    maxWeight = max(ropes[i] * (n-i), maxWeight)
}

print(maxWeight)