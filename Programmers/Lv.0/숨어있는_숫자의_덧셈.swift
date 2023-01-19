import Foundation

func solution(_ my_string:String) -> Int {  
    var sum: Int = 0
    var num_array: [Character] = my_string.filter{["1", "2", "3", "4", "5", "6", "7", "8", "9"].contains($0)}

    for character in num_array{
        sum += character.hexDigitValue!
    }

    return sum
}