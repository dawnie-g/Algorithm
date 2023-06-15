import Foundation

func solution(_ my_string:String, _ index_list:[Int]) -> String {
    let string = Array(my_string)
    
    return String(index_list.map{string[$0]})
}