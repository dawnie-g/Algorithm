class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var graph = [Int: [Int]]()

        for edge in edges {
            let u = edge[0]
            let v = edge[1]

            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        print(graph)

        var queue = [source]
        var head = 0
        var tail = 1
        var visited = [Bool](repeating: false, count: n)

        if source == destination { return true }
        visited[source] = true

        while head < tail {
            let curr = queue[head]
            head += 1
            
            guard let neighbors = graph[curr] else { continue }

            for neighbor in neighbors where !visited[neighbor] {
                if neighbor == destination { return true }

                queue.append(neighbor)
                tail += 1
                visited[neighbor] = true
            }
        }

        return false
    }
}