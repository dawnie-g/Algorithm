let n = Int(readLine()!)!
var ingredient = [(Int, Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    ingredient.append((input[0], input[1]))
}

let total = 1 << n
var minSub = Int.max
for i in 1..<total {
    var food = (1, 0)
    var trigger = false
    
    for j in 0..<n {
        if i & (1 << j) != 0 {
            food.0 *= ingredient[j].0
            food.1 += ingredient[j].1
            trigger = true
        }
    }
    
    if trigger {
        minSub = min(minSub, abs(food.0 - food.1))
    }
}

print(minSub)