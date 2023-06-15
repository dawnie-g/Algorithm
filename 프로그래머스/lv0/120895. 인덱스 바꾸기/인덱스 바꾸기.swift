import Foundation

func solution(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
    var array = Array(my_string)
    array.swapAt(num1, num2)
    
    return array.map{String($0)}.joined()
}