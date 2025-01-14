class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        var setA: Set<Int> = []
        var setB: Set<Int> = []
        var common: Int = 0
        var arrayC: [Int] = []
        arrayC.reserveCapacity(A.capacity)

        for (n, m) in zip(A, B) {
            if n == m {
                common += 1
            } else {
                if setA.contains(m) {
                    common += 1
                }
                if setB.contains(n) {
                    common += 1
                }
                setA.insert(n)
                setB.insert(m)
            }
            arrayC.append(common)
        }
        
        return arrayC
    }
}