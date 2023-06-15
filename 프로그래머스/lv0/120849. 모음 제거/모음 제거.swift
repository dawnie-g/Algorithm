import Foundation

func solution(_ my_string:String) -> String { 
    var no_collection: String = ""
    for character in my_string{
        switch character {
        case "a", "e", "i", "o", "u":
            break
        default: no_collection += String(character)
        }
    }
    return no_collection
}