class Solution {
    private var cache: [Int: Int] = [:]

    func climbStairs(_ n: Int) -> Int {
        if [1, 2].contains(n) { return n }

        let steps = (cache[n-1] ?? climbStairs(n-1)) + (cache[n-2] ?? climbStairs(n-2))
        cache[n] = steps

        return steps
    }
}