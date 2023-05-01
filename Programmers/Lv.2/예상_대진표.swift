import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var round = Int(log2(Double(n)))
    var game = (1...n)
    var mid = (game.first!+game.last!-1)/2
    let A = min(a, b)
    let B = max(a, b)

    for i in 1...round {
        if A <= mid && B > mid { 
            break 
        } else if A <= mid && B <= mid {
            game = (game.first!...mid)
        } else {
            game = (mid+1...game.last!)
        }
        round -= 1
        mid = (game.first!+game.last!-1)/2
    }

    return round
}