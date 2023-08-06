import Foundation

func solution(_ dirs:String) -> Int {
    var cur = [0, 0]
    var move: [[Int]] = []
    var to = [0, 0]
    var ans = 0
    
    for d in dirs {
        switch d {
            case "U":
            to = [cur[0], cur[1]+1]
            case "D":
            to = [cur[0], cur[1]-1]
            case "R":
            to = [cur[0]+1, cur[1]]
            default:
            to = [cur[0]-1, cur[1]]
        }
        guard -5...5 ~= to[0] && -5...5 ~= to[1] else { continue }
        if !move.contains(cur + to) && !move.contains(to + cur) {
            move.append(cur + to)
            ans += 1
        }
        cur = to
    }
    
    return ans
}