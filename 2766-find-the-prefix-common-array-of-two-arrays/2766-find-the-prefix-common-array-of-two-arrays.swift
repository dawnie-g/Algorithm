class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        let n = A.count
        var visitedA = [Bool](repeating: false, count: n + 1)
        var visitedB = [Bool](repeating: false, count: n + 1)
        var common: Int = 0
        var arrayC: [Int] = []
        arrayC.reserveCapacity(A.capacity)

        for (a, b) in zip(A, B) {
            if a == b {
                common += 1
            } else {
                if visitedA[b] {
                    common += 1
                }
                if visitedB[a] {
                    common += 1
                }
                visitedA[a] = true
                visitedB[b] = true
            }
            arrayC.append(common)
        }
        
        return arrayC
    }
}