import Foundation

func solution(_ record:[String]) -> [String] {
    var lines = [[String]]()
    var match = [String:String]() // id, nickname
    var result = [String]()
    
    for i in 0..<record.count {
        let info = record[i].split(separator: " ").map{String($0)} // status, id, nickname
        
        switch info[0] {
            case "Enter":
            lines.append(info)
            match[info[1]] = info[2]
            case "Change":
            match[info[1]] = info[2]
            default: lines.append(info)
        }
    }
    
    for line in lines {
        if line[0] == "Enter" {
            result.append("\(match[line[1]]!)님이 들어왔습니다.")
        } else { // Leave
            result.append("\(match[line[1]]!)님이 나갔습니다.")
        }
    }
    
    return result
}