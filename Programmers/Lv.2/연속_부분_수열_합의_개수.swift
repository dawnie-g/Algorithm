import Foundation

func solution(_ elements:[Int]) -> Int {
    let base = elements + elements
    let count = elements.count
    var array = elements
    var ans = array
    
    for i in 1..<count {
        array = zip(array, base[i..<i+count]).map{$0.0 + $0.1}
        ans.appned(contentsOf: array)
    }
    
    return Set(ans).count
}