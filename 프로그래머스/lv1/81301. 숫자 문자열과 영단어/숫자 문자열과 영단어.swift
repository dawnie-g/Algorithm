import Foundation

func solution(_ s:String) -> Int {
    var strings = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var numbers = s
    
    for i in 0..<strings.count {
        numbers = numbers.replacingOccurrences(of: strings[i], with: String(i))
    }
    
    return Int(numbers)!
}