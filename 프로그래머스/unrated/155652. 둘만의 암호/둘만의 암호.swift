import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                   "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                   "u", "v", "w", "x", "y", "z"].filter{!Array(skip).contains($0)}
    
    var word = s.map{$0}.map{alphabet[(alphabet.firstIndex(of: $0)!+index) % (26-skip.count)]}
    
    return String(word)
}