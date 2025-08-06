class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        let len = arr.count
        guard len >= 3 else { return false }
        
        var prev = arr[0]
        var increase = false
        var decrease = false
        var acrossTop = false

        for i in 1..<len {
            if !increase && !acrossTop && arr[i] > arr[i-1] {
                increase = true
            }

            if !acrossTop && arr[i] < arr[i-1] {
                acrossTop = true
            }

            if !decrease && acrossTop && arr[i] < arr[i-1] {
                decrease = true
            }

            let beforeTopDecreasing = !acrossTop && arr[i] < arr[i-1]
            let afterTopIncreasing = acrossTop && arr[i] > arr[i-1]
            let notStrictly = arr[i] == arr[i-1]
            
            if beforeTopDecreasing || afterTopIncreasing || notStrictly {
                return false
            }
        }

        return increase && decrease
    }
}