let n = Int(readLine()!)!
var values = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var left = 0
var right = n - 1
var closest = Int.max
var ans = (0, 0)

while left < right {
    let sum = values[left] + values[right]
    
    if abs(closest) > abs(sum) {
        closest = sum
        ans = (values[left], values[right])
    }
    
    if sum > 0 {
        right -= 1
    } else {
        left += 1
    }
}

print(ans.0, ans.1)