import Foundation

func solution(_ book_time:[[String]]) -> Int {
    let book_time = book_time.map{$0.map{Int($0.replacingOccurrences(of: ":", with: ""))!}}.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
    
    var rooms = [[Int]]()
    
    outer: for guest in book_time {
        var start = guest[0]
        var end = guest[1]
        
        end = end % 100 > 50 ? end + 50 : end + 10
        
        for i in 0..<rooms.count {
            if start >= rooms[i][1] {
                rooms[i][1] = end
                continue outer
            }
        }
        
        rooms.append([start, end])
    }
    
    return rooms.count
}