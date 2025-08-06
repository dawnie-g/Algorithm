class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        let len = arr.count
        guard len >= 3 else { return false }
        
        var increase = false
        var decrease = false

        for i in 1..<len {
            if !increase && arr[i] > arr[i-1] {
                increase = true
            }

            if !decrease && arr[i] < arr[i-1] {
                decrease = true
            }

            let beforeTopDecreasing = !decrease && arr[i] < arr[i-1]
            let afterTopIncreasing = decrease && arr[i] > arr[i-1]
            let notStrictly = arr[i] == arr[i-1]
            
            if beforeTopDecreasing || afterTopIncreasing || notStrictly {
                return false
            }
        }

        return increase && decrease
    }
}