import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    let keyMax = keymap.map{$0.count}.max()!
    let keymap = keymap.map{$0.map{$0} + [Character](repeating: " ", count: keyMax - $0.count)}
    var times = [Int]()
    
    for target in targets {
        var pushKey = 0
        input: for t in target {
            var i = 0
            while i < keyMax {
                if keymap.map{$0[i]}.contains(t) {
                    pushKey += (i+1)
                    continue input
                }
                i += 1
            }
            pushKey = 0
            break input
        }
        times.append(pushKey == 0 ? -1 : pushKey)
    }
    
    return times
}