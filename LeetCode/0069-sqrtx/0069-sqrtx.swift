class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 0 else { return 0 }
        
        var low = 0
        var high = x
        
        while low < high {
            let mid = (low + high) / 2
            
            if mid * mid == x {
                return mid
            } else if mid * mid < x {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return low * low <= x ? low : low - 1
    }
}