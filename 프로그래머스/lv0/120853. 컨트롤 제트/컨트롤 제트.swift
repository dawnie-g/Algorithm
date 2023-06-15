import Foundation

func solution(_ s:String) -> Int {
    var array = s.components(separatedBy: " ")
    var index: Int
    
    while array.contains("Z"){
        index = array.firstIndex(of: "Z")!
        array.remove(at: index - 1)
        array.remove(at: index - 1)
    }
    
    return array.map{Int($0) ?? 0}.reduce(0,+)
}