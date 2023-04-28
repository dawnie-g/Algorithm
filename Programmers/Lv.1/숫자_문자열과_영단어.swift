import Foundation

func solution(_ s:String) -> Int {
    var dic: Dictionary = [
        "one":"1", "two":"2", "three":"3",
        "four":"4", "five":"5", "six":"6",
        "seven":"7", "eight":"8", "nine":"9", "zero":"0"
    ]
    var numbers: [String] = []
    var number: String = ""
    
    for c in Array(s) {
        number += String(c)
        if dic.keys.contains(number) {
            numbers.append(dic[number] ?? "nil")
            number = ""
        } else if dic.values.contains(number) {
            numbers.append(number)
            number = ""
        }
    }
    
    return Int(numbers.joined()) ?? 0
}