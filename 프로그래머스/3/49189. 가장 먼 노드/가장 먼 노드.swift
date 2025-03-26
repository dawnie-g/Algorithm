import Foundation

/*
1번에서 최단경로상 간선이 가장 많은 노드의 '갯수'
- 시작은 항상 1번 노드

우선은 각각의 노드에서의 간선에 대한 그래프
방문한 노드를 표시하기 위한 크기가 n+1인 Bool 배열
현재노드와 거리의 정보를 담고 있는 queue


*/

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:] // 연결된 노드
    var visited = [Bool](repeating: false, count: n + 1)
    var queue: [(Int, Int)] = []
    // var depth: [Int: [Int]] = [:]
    var ans: (distance: Int, count: Int) = (0, 0)
    
    // 그래프 저장
    for e in edge {
        graph[e[0], default: []].append(e[1])
        graph[e[1], default: []].append(e[0])
    }
    
    // print(graph)
    
    queue.append((1, 0))
    // depth[0, default: []].append(1)
    ans.1 += 1
    visited[1] = true
    
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        let currNode = curr.0
        let distance = curr.1
        
        // depth[distance, default: []].append(currNode)
        if distance > ans.distance {
            ans.distance = distance
            ans.count = 1
        } else if distance == ans.distance {
            ans.count += 1
        }
        
        guard let nodes = graph[currNode] else { break }
        
        for node in nodes where !visited[node] {
            queue.append((node, distance + 1))
            visited[node] = true
        }
    }
    
    
    // print(depth)
    return ans.count
}