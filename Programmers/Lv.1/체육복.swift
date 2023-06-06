import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let newReserve = reserve.filter{!lost.contains($0)}
    let newLost = lost.filter{!reserve.contains($0)}
    var lostStudent = newLost.count

    newReserve.forEach {
        let canHelp = newLost.contains($0-1) || newLost.contains($0+1)
        if canHelp && lostStudent > 0 {
            lostStudent -= 1
        }
    }
    
    return n-lostStudent
}