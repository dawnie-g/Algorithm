let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let target = readLine()!.split(separator: " ").map{Int(String($0))!}
var queue = Array(1...n)
var pointer = 0
var size = n
var ans = 0

for key in target {
    let keyIdx = queue.firstIndex(of: key)!
    var d = abs(pointer - keyIdx)
    d = min(d, size-d)
    pointer = keyIdx
    queue.remove(at: pointer)
    ans += d
    size -= 1
}
print(ans)