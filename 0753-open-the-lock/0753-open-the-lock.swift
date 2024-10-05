class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let deadends = Set(deadends)
        guard !deadends.contains("0000") else { return -1 }
        
        let target = target.map { Int(String($0))! }
        let direction = [
            [1, 0, 0, 0], [-1, 0, 0, 0], 
            [0, 1, 0, 0], [0, -1, 0, 0], 
            [0, 0, 1, 0], [0, 0, -1, 0], 
            [0, 0, 0, 1], [0, 0, 0, -1]
        ]
        var visited = [Bool](repeating: false, count: 10000)
        var step = 0

        var queue = [[0, 0, 0, 0]]
        
        while !queue.isEmpty {
            let currentLevelCount = queue.count
            
            for _ in 0..<currentLevelCount {
                let curr = queue.removeFirst()
                
                if curr == target { return step }
                
                let idx = arrToIdx(curr)
                visited[idx] = true

                for dir in direction {
                    let arr = (0...3).map { (curr[$0] + dir[$0] + 10) % 10 }
                    let idx = arrToIdx(arr)
                    
                    if visited[idx] || deadends.contains(arr.map { String($0) }.joined()) {
                        continue
                    }
                    
                    visited[idx] = true
                    queue.append(arr)
                }
            }
            step += 1
        }
        
        return -1
    }
    
    func arrToIdx(_ arr: [Int]) -> Int {
        return arr[0] * 1000 + arr[1] * 100 + arr[2] * 10 + arr[3]
    }
}