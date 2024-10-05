class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let deadends = Set(deadends)
        guard !deadends.contains ("0000") else { return -1 }
        let target = target.map { Int(String($0))! }
        let direction = [
            [1, 0, 0, 0], [-1, 0, 0, 0], [0, 1, 0, 0], [0, -1, 0, 0], 
            [0, 0, 1, 0], [0, 0, -1, 0], [0, 0, 0, 1], [0, 0, 0, -1]
            ]
        var visited = Set<Int>()
        var step = 0

        var queue = [[0, 0, 0, 0]]
        var head = 0
        var tail = 1
        
        while head != tail {
            for _ in 0..<tail-head {
                let curr = queue[head]
                if curr == target { return step }
                head += 1
                visited.insert(arrToIdx(curr))

                for dir in direction {
                    let arr = (0...3).map { (curr[$0] + dir[$0] + 10) % 10 }
                    let str = arr.map { String($0) }.joined()

                    if !visited.contains(arrToIdx(arr)) && !deadends.contains(str) {
                        visited.insert(arrToIdx(arr))
                        queue.append(arr)
                        tail += 1
                    }
                }
            }
            step += 1
        }
        return -1
    }
}

func arrToIdx(_ arr: [Int]) -> Int {
    return Int(arr.map { String($0) }.joined())!
}