import Foundation

func solution(_ my_string:String) -> String { 
    var result: [String] = []
    for char in my_string{
        if char.isUppercase{
            result.append(char.lowercased())
        }else{
            result.append(char.uppercased())
        }
    }
    return result.joined()
}