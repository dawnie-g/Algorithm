let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
var tallers = [Int: [Int]]()

for i in stride(from: n, to: 0, by: -1) {
    let value = input[i - 1]
    tallers[value, default: []].append(i)
}

var line = [Int]()
for number in tallers.keys.sorted() {
    guard number != 0 else {
        line += tallers[number]!.sorted(by: <)
        continue
    }
    
    for height in tallers[number]! {
        var cnt = 0
        for i in 0..<line.count {
            if line[i] > height {
                cnt += 1
                if cnt == number {
                    line.insert(height, at: i + 1)
                }
            }
        }
    }
}

var str = ""
for height in line {
    str += "\(height) "
}
print(str)