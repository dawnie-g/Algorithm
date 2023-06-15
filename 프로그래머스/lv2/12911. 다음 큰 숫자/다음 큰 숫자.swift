import Foundation

func solution(_ n:Int) -> Int
{
    var bigger = n + 1
    while String(bigger, radix: 2).filter{$0 == "1"}.count != String(n, radix: 2).filter{$0 == "1"}.count {
        bigger += 1
    }
    
    return bigger
}