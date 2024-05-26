import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), bIdx = 0; buffer.append(0)

@inline(__always) func read() -> UInt8 {
  defer { bIdx += 1 }
  return buffer.withUnsafeBufferPointer { $0[bIdx] }
}

@inline(__always) func readInt() -> Int {
  var number = 0, byte = read(), isNegative = false
  while byte == 10 || byte == 32 { byte = read() }
  if byte == 45 { byte = read(); isNegative = true }
  while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = read() }
  return number * (isNegative ? -1 : 1)
}

let n = readInt()
let m = readInt()
let bag = readInt()

var ground = [Int](repeating: 0, count: n*m)
var lowVal = Int.max
var minTime = Int.max
var minFloor = Int.max

for i in 0..<n*m {
    let num = readInt()
    ground[i] = num
    lowVal = min(lowVal, num)
}

for h in lowVal...256 {
    var dig = 0
    var put = 0
    
    ground.forEach {
        let diff = h - $0
        if diff < 0 {
            dig += -diff
        } else {
            put += diff
        }
    }
    
    if dig + bag < put { break }
    
    if minTime >= dig * 2 + put && bag + dig >= put {
        minTime = dig * 2 + put
        minFloor = h
    }
}

print(minTime, minFloor)
