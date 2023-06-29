let input = readLine()!.split(separator: " ").map{Int(String($0))!}

func bfs(_ subin: Int, _ sister: Int) -> Int {
    var map = [Int](repeating: -1, count: 100_001)
    map[subin] = 0
    
    var queue = [subin]
    var idx = 0

    while map[sister] == -1 {
        var cur = queue[idx]
        idx += 1
        for next in [cur+1, cur-1, cur*2] {
            guard 0...100_000 ~= next else { continue }
            guard map[next] == -1 else { continue }
            queue.append(next)
            map[next] = map[cur] + 1
        }
    }
    return map[sister]
}

print(bfs(input[0], input[1]))