import Foundation

func solution(_ s:String) -> Int{
    guard s.count % 2 == 0 else {return 0}
    var array: [Character] = []
    
    for c in s {
        if array.last == c {
            array.removeLast()
        }else {
            array.append(c)
        }
    }
    
    return array.isEmpty ? 1 : 0
}