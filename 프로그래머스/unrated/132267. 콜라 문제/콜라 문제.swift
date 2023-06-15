import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var bottle = n
    var reward = 0
    
    while bottle >= a {
        reward += (bottle/a) * b
        bottle -= (bottle/a) * (a-b)
    }
    
    return reward
}