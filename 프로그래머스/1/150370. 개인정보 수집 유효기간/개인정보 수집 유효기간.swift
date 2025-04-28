import Foundation

/*

*/

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let today = today.components(separatedBy: ".").map { Int($0)! }
    var period = [String: Int]()
    var expired = [Int]()
    
    for term in terms {
        let term = term.components(separatedBy: " ")
        period[term[0]] = Int(term[1])!
    }
    
    for i in 0..<privacies.count {
        let privacy = privacies[i].components(separatedBy: " ")
        let date = privacy[0].components(separatedBy: ".").map { Int($0)! } // year, month, day
        let period = period[privacy[1]]!
        var expYear = date[0] + period / 12
        var expMonth = date[1] + period % 12
        let expDay = date[2] - 1
        if expMonth > 12 {
            expYear += expMonth / 12
            expMonth %= 12
        }
        
        if today[0] > expYear {
            expired.append(i+1)
        } else if today[0] == expYear && today[1] > expMonth {
            expired.append(i+1)
        } else if today[0] == expYear && today[1] == expMonth && today[2] > expDay {
            expired.append(i+1)
        }
    }
    
    return expired
}