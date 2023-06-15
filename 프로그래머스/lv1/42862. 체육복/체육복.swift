import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var r = reserve.filter{!lost.contains($0)}
    let l = lost.filter{!reserve.contains($0)}
    var attend = 0

    for student in 1...n {
        if l.contains(student) {
            guard !r.isEmpty else { continue }
            if r.contains(student-1) {
                r.remove(at: r.firstIndex(of: student-1)!)
            } else if r.contains(student+1) {
                r.remove(at: r.firstIndex(of: student+1)!)
            } else {
                continue
            }
        }
        attend += 1
    }

    return attend
}