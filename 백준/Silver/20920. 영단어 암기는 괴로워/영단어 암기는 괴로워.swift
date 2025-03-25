let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var freq: [String: Int] = [:]

for _ in 0..<n {
    guard let word = readLine(), word.count >= m else { continue }
    
    freq[word, default: 0] += 1
}

let list = freq.keys.sorted { (freq[$1]!, $1.count, $0) < (freq[$0]!, $0.count, $1) }

print(list.joined(separator: "\n"))
