let input = readLine()!.split(separator: " ").map{Int($0)!} // [n, k]

let n = input[0]
let k = input[1]

var array = Array(1...n)
var ans = [Int]()
var target = -1

while ans.count < n {
    var count = 0
    while count < k {
        count += array[(target + 1) % n] != 0 ? 1 : 0
        target = (target + 1) % n
    }
    array[target] = 0
    ans.append(target + 1)
}

print("<" + ans.map{String($0)}.joined(separator: ", ") + ">")