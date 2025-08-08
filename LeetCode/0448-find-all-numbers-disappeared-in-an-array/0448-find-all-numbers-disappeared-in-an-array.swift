class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var visited = [Bool](repeating: false, count: n + 1)

        for num in nums where !visited[num] {
            visited[num] = true
        }

        return (1...n).filter { !visited[$0] }
    }
}