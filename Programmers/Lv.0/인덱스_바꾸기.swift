import Foundation

func solution(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
    var stringArray = my_string
    var temp: String = stringArray[num1]
    stringArray[num1] = stringArray[num2]
    stringArray[num2] = temp
    
    return stringArray.joined()
}