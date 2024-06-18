let s = readLine()!
let sCount = s.count
var t = readLine()!.map { String($0) }
var reversed = false
var head = 0
var tail = t.count - 1

if t.last! == "B" {
    t = t.reversed()
    reversed = true
}

while tail - head >= sCount {
    let p = reversed ? head : tail
    
    if !reversed {
        tail -= 1
    } else {
        head += 1
    }
    
    if t[p] == "B" {
        reversed.toggle()
    }
}

var result = reversed ? t[head...tail].reversed().joined() : t[head...tail].joined()

if s == result {
    print(1)
} else {
    print(0)
}