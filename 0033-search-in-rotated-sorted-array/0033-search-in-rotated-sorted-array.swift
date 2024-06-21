class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.contains(target) else { return -1 }

        let sortedNums = nums.enumerated().sorted { $0.1 < $1.1 }
        var low = 0
        var high = nums.count - 1

        while low <= high {
            let midIdx = (low + high) / 2
            let mid = sortedNums[midIdx]

            if mid.1 == target {
                return mid.0
            } else if mid.1 < target {
                low = midIdx + 1
            } else {
                high = midIdx - 1
            }
        }

        return sortedNums[low].1 == target ? sortedNums[low].0 : -1
    }
}