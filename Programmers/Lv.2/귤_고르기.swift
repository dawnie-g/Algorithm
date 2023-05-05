import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var t = tangerine.sorted()
    var count: [Int] = Array(repeating: 0, count: t.last!)
    var sum = 0
    var type = 0

    for o in t {
        count[o-1] += 1
    }

    for n in count.filter{$0 != 0}.sorted(by: >) {
        sum += n
        type += 1
        if sum >= k {break}
    }

    return type
}