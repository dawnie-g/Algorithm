import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    var repeat_string: String = ""
    
    for character in my_string {
        for i in 1...n {
            repeat_string += String(character)
        }
    }
    
    return repeat_string
}