let len = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map{Int($0)!}
let x = Int(readLine()!)!

var number = Array(repeating: false, count: 2000000)
var count = 0

for n in array {
    if x-n > 0 && number[x-n] == true {
        count += 1
    }
    number[n] = true
}

print(count)