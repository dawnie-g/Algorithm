import Foundation

func solution(_ n:Int) -> Int 
{
    var rest = n
    var ans = 1
    
    while rest != 1 {
        if rest%2 == 1 { ans += 1 }
        rest /= 2
    }
    
    return ans
}