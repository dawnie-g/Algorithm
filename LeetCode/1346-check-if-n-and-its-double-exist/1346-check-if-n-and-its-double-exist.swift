class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        let len = arr.count

        for i in 0..<(len - 1) {
            for j in (i + 1)..<len where arr[i] == 2 * arr[j] || arr[j] == 2 * arr[i] {
                return true
            }
        }

        return false
    }
}