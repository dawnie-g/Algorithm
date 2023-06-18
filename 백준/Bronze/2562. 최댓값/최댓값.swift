var max = 0
var n = 0

for i in 1...9 {
    let input = Int(readLine()!)!
    
    if input > max {
        max = input
        n = i
    }
}

print(max)
print(n)