class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var nums: [Int] = nums.sorted(by: >)
        var results: [Int] = []
        var operationCount: Int = 0

        while (!nums.isEmpty && nums.last! < k) || (!results.isEmpty && results.first! < k) {
            var mins: [Int] = [0, 0]

            // 가장 작은 두 수 찾기
            for i in 0..<2 {
                if !nums.isEmpty && !results.isEmpty {
                    if nums.last! <= results.first! {
                        mins[i] = nums.removeLast()
                    } else {
                        mins[i] = results.removeFirst()
                    }
                } else if nums.isEmpty {
                    mins[i] = results.removeFirst()
                } else if results.isEmpty {
                    mins[i] = nums.removeLast()
                }
            }

            let operation = mins[0] * 2 + mins[1]
            results.append(operation)
            operationCount += 1
        }

        return operationCount
    }
}