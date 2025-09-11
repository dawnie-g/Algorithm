class Solution {
    private var cache: [Int: Int] = [:]

    func fib(_ n: Int) -> Int {
        if [0, 1].contains(n) {
            return n
        }

        let num1 = cache[n-1] ?? fib(n-1)
        let num2 = cache[n-2] ?? fib(n-2)

        cache[n] = num1 + num2
        
        return num1 + num2
    }
}