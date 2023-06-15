
import Foundation

func solution(_ my_string: String) -> Int {
    let a = my_string.map{$0.isNumber ? String($0) : " "}
    
    return a.joined().components(separatedBy: " ").filter{$0 != ""}.map{Int(String($0))!}.reduce(0, +)
}