import Foundation

func solution(_ elements:[Int]) -> Int {
    let base = elements + elements
    let count = elements.count
    var array = elements
    
    for i in 1..<count {
        array += zip(array.suffix(count), base[i..<i+count]).map{$0.0 + $0.1}
    }
    
    return Set(array).count
}