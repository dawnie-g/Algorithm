class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        guard n > 2 else { return 2 }

        var prev1 = 2
        var prev2 = 1
        
        for _ in 3...n {
            let curr = prev1 + prev2
            prev2 = prev1
            prev1 = curr
        }

        return prev1
    }
}