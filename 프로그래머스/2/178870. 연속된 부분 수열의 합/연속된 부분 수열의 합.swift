import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    let size = sequence.count
    var sum = 0
    var head = size - 1
    var tail = size - 1
    var ans = [0, size]
    
    while head >= 0 {
        guard sequence[head] >= sequence[ans[0]] else { break }
        
        sum += sequence[head]
        head -= 1
        
        if sum > k {
            sum -= sequence[tail]
            tail -= 1
        }
        
        if sum == k && tail - head <= ans[1] - ans[0] + 1 {
            ans = [head + 1, tail]
        }
    }
    
    return ans
}