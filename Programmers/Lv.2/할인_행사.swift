import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var list: [String] = []
    var registration = 0

    for (product, number) in zip(want, number).map{$0} {
        for _ in 1...number {
            list.append(product)
        }
    }
    list = list.sorted()
    
    let maxIdx = discount.count-10
    for i in 0...maxIdx {
        if discount[i..<i+10].sorted() == list {
            registration += 1
        }
    }

    return registration
}