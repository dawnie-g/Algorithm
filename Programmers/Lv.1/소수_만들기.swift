import Foundation

func solution(_ nums:[Int]) -> Int {
    var count = 0

    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                let sum = nums[i] + nums[j] + nums[k]
                for s in 2..<sum {
                    if sum % s == 0 { break }
                    if s == sum - 1 { count += 1 }
                }
            }
        }
    }

    return count
}