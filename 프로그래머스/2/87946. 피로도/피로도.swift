import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: dungeons.count)
    var maxDepth = 0
    
    func dfs(_ stamina: Int, _ depth: Int) {
        maxDepth = max(maxDepth, depth)
        for i in 0..<dungeons.count where !visited[i] && stamina >= dungeons[i][0] {
            visited[i] = true
            dfs(stamina - dungeons[i][1], depth + 1)
            visited[i] = false
        }
    }
    
    dfs(k, 0)
    
    return maxDepth
}