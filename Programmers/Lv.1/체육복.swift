import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var newReserve = reserve.filter{!lost.contains($0)}
    let newLost = lost.filter{!reserve.contains($0)}
    var attend = 0

    for student in 1...n {
        if newLost.contains(student) {
            guard !newReserve.isEmpty else { continue }
            if newReserve.contains(student-1) {
                newReserve.remove(at: newReserve.firstIndex(of: student-1)!)
            } else if newReserve.contains(student+1) {
                newReserve.remove(at: newReserve.firstIndex(of: student+1)!)
            } else {
                continue
            }
        }
        attend += 1
    }

    return attend
}