let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var freq: [String: Int] = [:]

for _ in 0..<n {
    guard let word = readLine(), word.count >= m else { continue }
    
    freq[word, default: 0] += 1
}

let list = freq.sorted { ($1.value, $1.key.count, $0.key) < ($0.value, $0.key.count, $1.key) }

print(list.map { $0.key }.joined(separator: "\n"))