import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let n = privacies.count
    let today = today.split(separator: ".").map { Int(String($0))! }
    var termDict = [String: Int]()
    var expired = [Int]()
    
    for term in terms {
        let term = term.split(separator: " ").map { String($0) }
        let name = term[0]
        let period = Int(term[1])!
        
        termDict[name] = period
    }
    
    for i in 0..<n {
        let privacy = privacies[i].split(separator: " ").map { String($0) }
        var date = privacy[0].split(separator: ".").map { Int($0)! }
        let term = termDict[privacy[1]] ?? 0
        
        let year = term / 12
        let month = term % 12
        date[0] += year
        date[1] += month
        
        if date[1] > 12 {
            date[0] += 1
            date[1] %= 12
        }
        
        if today[0] > date[0] {
            expired.append(i+1)
        } else if today[0] == date[0] {
            if today[1] > date[1] {
                expired.append(i+1)
            } else if today[1] == date[1] {
                if today[2] >= date[2] {
                    expired.append(i+1)
                }
            }
        }
    }
    
    
    return expired
}