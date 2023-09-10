let n = Int(readLine()!)!
var timeLine = (0..<n).map{_ in readLine()!.split(separator: " ").map{Int($0)!}}.sorted(by: { ($0[0], $0[1]) < ($1[0], $1[1]) })
var use = [[Int]]()

for meeting in timeLine {
    guard !use.isEmpty else {
        use.append(meeting)
        continue
    }
    
    if meeting[1] < use.last![1] {
        use.removeLast()
        use.append(meeting)
    } else if use.last![1] <= meeting[0] {
        use.append(meeting)
    }
}

print(use.count)