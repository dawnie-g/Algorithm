class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var jewelsSet = Set<Character>()

        for jewel in jewels {
            jewelsSet.insert(jewel)
        }

        var ans = 0
        for stone in stones where jewelsSet.contains(stone) {
            ans += 1
        }

        return ans
    }
}