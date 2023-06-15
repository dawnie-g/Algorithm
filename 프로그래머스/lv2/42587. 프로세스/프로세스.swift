import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = zip(priorities, Array(0..<priorities.count)).map{$0}
    var ans = 0
    var pop: (Int, Int)

    while queue.count > 1 {
        pop = queue.removeFirst()
        if pop.0 >= queue.map{$0.0}.max()! {
            ans += 1
            if pop.1 == location { return ans }
        } else {
            queue.append(pop)
        }
    }
    
    return priorities.count
}