let n = Int(readLine()!)!
var graph = [Int: [Int]]()
var ans = [[Int]]()

for i in 0..<n {
    let edges = readLine()!.split(separator: " ").map { Int($0)! }
    ans.append(edges)
    for j in 0..<n where edges[j] == 1 {
        graph[i, default: []].append(j)
    }
}

for i in 0..<n {
    guard var queue = graph[i] else { continue }
    var head = 0
    var tail = queue.count
    var visited = [Bool](repeating: false, count: n)
    
    while head < tail {
        let j = queue[head]
        head += 1
        visited[j] = true
        
        if let neighbors = graph[j] {
            for neighbor in neighbors where !visited[neighbor] {
                queue.append(neighbor)
                tail += 1
                ans[i][neighbor] = 1
                visited[neighbor] = true
            }
        }
    }
}

var str = ""
for i in ans {
    let line = i.map { String($0) }.joined(separator: " ")
    str += line + "\n"
}

print(str)
