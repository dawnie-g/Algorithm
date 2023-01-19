import Foundation

func solution(_ my_string:String, _ letter:String) -> String { my_string.filter{String($0) != letter } }