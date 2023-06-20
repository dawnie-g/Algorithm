let input = readLine()!.split(separator: " ").map{Int($0)!} // [n, k]

let n = input[0]
let k = input[1]

var array = Array(1...n)
var ans = "<"
var idx = k-1

while array.count != 1 {
    if idx >= array.count {
        idx %= array.count
    }
    let target = array.remove(at: idx)
    ans += String(target) + ", "
    idx += k-1
}
ans += String(array.last!)
print(ans + ">")