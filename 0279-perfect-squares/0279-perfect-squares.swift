class Solution {
    func numSquares(_ n: Int) -> Int {
        let squares = (1...Int(sqrt(Double(n)))).map { $0 * $0 }
        var queue = [(0, 0)] // sum, count
        var head = 0
        var tail = 1
        var visited = [Bool](repeating: false, count: n + 1)

        while head != tail {
            let curr = queue[head]
            head += 1
            var sum = curr.0
            let count = curr.1

            if sum == n {
                return count
            }

            for i in 0..<squares.count {
                let newSum = sum + squares[i]

                if newSum <= n && !visited[newSum] {
                    queue.append((newSum, count + 1))
                    tail += 1
                    visited[newSum] = true
                }
            }
        }

        return n
    }
}