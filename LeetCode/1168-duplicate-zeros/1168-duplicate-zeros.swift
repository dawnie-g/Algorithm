class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var queue = [Int]()
        var p = 0

        for i in 0..<arr.count {
            if arr[i] == 0 {
                queue.append(0)
            }
            queue.append(arr[i])
            arr[i] = queue[p]
            p += 1
        }
    }
}