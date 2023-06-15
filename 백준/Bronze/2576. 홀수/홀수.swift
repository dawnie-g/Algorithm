var odd = [Int]()
var num = 0

for _ in 1...7 {
    num = Int(readLine()!)!
    if num % 2 == 1 {
        odd.append(num)
    }
}

print(odd.count > 0 ? odd.reduce(0, +) : -1)
print(odd.count > 0 ? odd.min()! : " ")