import Foundation

func solution(_ s:String) -> [Int] {
    var r: [Character] = Array(s).reversed()
    var ans: [Int] = []
    
    for i in 0..<r.count {
        for j in i+1..<r.count {
            if r[i] == r[j] {
                ans.append(j-i)
                break
            }
            if j == r.count-1 {
                ans.append(-1)
            }
        }
    }
    ans.append(-1)
    
    return ans.reversed()
}