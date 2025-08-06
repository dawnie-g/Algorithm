class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        let len = arr.count
        guard len >= 3 else { return false }
        
        var prev = arr[0]
        var increase = false
        var decrease = false
        var acrossTop = false

        for i in 1..<len {
            if !increase && !acrossTop && arr[i] > prev {
                increase = true
            }

            if !acrossTop && arr[i] < prev {
                acrossTop = true
            }

            if !decrease && acrossTop && arr[i] < prev {
                decrease = true
            }

            let beforeTopDecreasing = !acrossTop && arr[i] < prev
            let afterTopIncreasing = acrossTop && arr[i] > prev
            let notStrictly = arr[i] == prev
            
            if beforeTopDecreasing || afterTopIncreasing || notStrictly {
                return false
            }

            prev = arr[i]
        }

        print(increase, decrease)

        return increase && decrease
    }
}