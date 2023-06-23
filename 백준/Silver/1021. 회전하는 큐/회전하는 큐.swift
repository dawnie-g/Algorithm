let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let target = readLine()!.split(separator: " ").map{Int(String($0))!}

var queue = Array(1...n)
var pointer = 0
var count = 0
var ans = 0

while count < input[1] {
    if queue[pointer] == target[count] {
        queue.remove(at: pointer)
        count += 1
        pointer = pointer == queue.count ? 0 : pointer
    } else {
        let idx = queue.firstIndex(of: target[count])!
        let right = idx > pointer ? idx - pointer : queue.count + idx - pointer
        let left = queue.count - right
        if right <= left { // target is closer to right
            pointer = (pointer + 1) % queue.count
            ans += 1
        } else { // target is closer to left
            pointer = pointer == 0 ? queue.count - 1 : pointer - 1
            ans += 1
        }
    }
}
print(ans)