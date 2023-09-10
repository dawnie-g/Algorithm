var formula = readLine()!.split(separator: "-")
let positive = formula.removeFirst().split(separator: "+").map{Int($0)!}.reduce(0, +)
let negative = formula.flatMap{$0.split(separator: "+")}.map{Int($0)!}.reduce(0, +)

print(positive-negative)