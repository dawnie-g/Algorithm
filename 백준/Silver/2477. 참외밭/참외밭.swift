let n = Int(readLine()!)!
var visited = [Bool](repeating: false, count: 7)
var inputs = [(Int, Int)]()
var longs = [Int]()
var shorts = [Int]()

for _ in 0..<6 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let dir = input[0]
    let len = input[1]
    
    if !visited[dir] {
        visited[dir] = true
    } else {
        shorts.append(dir)
    }
    
    inputs.append((dir, len))
}
longs = [1, 2, 3, 4].filter { !shorts.contains($0) }

let entire = inputs.filter { longs.contains($0.0) }.map { $0.1 }.reduce(1, *)

var longIdx = [Int]()
for i in 0..<6{
    if longs.contains(inputs[i].0) {
        longIdx.append(i)
    }
}
let shortIdx1 = longIdx == [0, 5] ? 2 : (longIdx[1] + 2) % 6
let shortIdx2 = shortIdx1 == 5 ? 0 : shortIdx1 + 1

let empty = inputs[shortIdx1].1 * inputs[shortIdx2].1
let field = entire - empty

print(field * n)
