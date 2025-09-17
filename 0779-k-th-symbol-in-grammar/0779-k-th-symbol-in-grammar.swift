class Solution {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        recur(n, k)
    }

    private func recur(_ n: Int, _ k: Int) -> Int {
        if n == 1 { return 0 }
        return recur(n - 1, (k + 1) / 2) ^ ((k + 1) % 2)
    }
}