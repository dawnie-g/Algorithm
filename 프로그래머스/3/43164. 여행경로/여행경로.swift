import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var dict: [String: [String]] = [:]
    
    for ticket in tickets {
        dict[ticket[0], default: []].append(ticket[1])
    }
    
    for arrival in dict.keys {
        dict[arrival]?.sort(by: >)
    }
    
    var ans: [String] = []
    let ticketCount = tickets.count
    
    func dfs(_ curr: String) {
        print("dfs(\(curr)) start")
        print("curr: \(curr)")
        print("dict[curr]: \(dict[curr] ?? [])")
        
        while let next = dict[curr]?.popLast() {
            print("next: \(next)")
            dfs(next)
            
            print("dfs(\(next)) done")
            print("curr: \(curr)")
            print("dict[curr]: \(dict[curr] ?? [])")
        }
        
        ans.append(curr)
        print("ans: \(ans)")
    }
    
    dfs("ICN")
    
    return ans.reversed()
}