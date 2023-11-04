import Foundation

func solution(_ new_id:String) -> String {
    var recommend = new_id.lowercased()
    .filter{$0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "."}
    .split(separator: ".").joined(separator: ".")
    
    if recommend.isEmpty { 
        recommend = "aaa"
    } else if recommend.count < 3 {
        recommend += String(repeating: recommend.last!, count: 3 - recommend.count)
    } else if recommend.count > 15 {
        recommend = String(recommend.prefix(15))
        if recommend.last! == "." {
            recommend.removeLast()
        }
    }
    
    return recommend
}