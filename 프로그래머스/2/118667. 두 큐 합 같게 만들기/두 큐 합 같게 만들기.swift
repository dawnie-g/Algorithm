import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var queue1 = queue1
    var queue2 = queue2
    var head1 = 0
    var head2 = 0
    var size = queue1.count
    var tail1 = size
    var tail2 = size
    var sum1 = queue1.reduce(0,+)
    var sum2 = queue2.reduce(0,+)
    var goal = (sum1 + sum2) / 2
    
    while sum1 != sum2 {
        guard tail1 < size * 2 || tail2 < size * 2 else { return -1 }
        guard head1 != tail1 && head2 != tail2 else { return -1 }
        if sum1 != sum2 && (sum1 == goal || sum2 == goal) { return -1 }
        
        if sum1 > goal {
            queue2.append(queue1[head1])
            sum1 -= queue1[head1]
            sum2 += queue1[head1]
            head1 += 1
            tail2 += 1
        } else if sum2 > goal {
            queue1.append(queue2[head2])
            sum2 -= queue2[head2]
            sum1 += queue2[head2]
            head2 += 1
            tail1 += 1
        } else {
            return -1
        }
    }
    return head1 + head2
}