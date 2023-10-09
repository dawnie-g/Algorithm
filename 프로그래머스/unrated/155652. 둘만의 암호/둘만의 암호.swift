import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz".filter{!skip.contains($0)})
    return String(s.map{alphabet[(alphabet.firstIndex(of: $0)!+index) % (26-skip.count)]})
}