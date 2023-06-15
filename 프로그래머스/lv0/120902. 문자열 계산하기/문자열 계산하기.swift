import Foundation

func solution(_ my_string:String) -> Int {
    var cal = my_string.components(separatedBy: " ")
    var result = Int(cal[0])!
    
    while cal.count != 1{
        result = cal[1] == "+" ? result + Int(cal[2])! : result - Int(cal[2])!
        cal.remove(at: 1)
        cal.remove(at: 1)
    }
    
    return result
}