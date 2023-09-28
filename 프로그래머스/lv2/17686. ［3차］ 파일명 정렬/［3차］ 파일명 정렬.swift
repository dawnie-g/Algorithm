import Foundation

func solution(_ files:[String]) -> [String] {
    var sepaName = [[String]]()
    
    for file in files {
        var head = ""
        var num = ""
        var tail = ""
        var numStart = false
        var tailStart = false
        
        for c in file {
            if !c.isNumber && numStart {
                tailStart = true
            } else if c.isNumber {
                numStart = true
            }
            
            if !numStart && !tailStart {
                head += String(c)
            } else if numStart && !tailStart {
                num += String(c)
            } else {
                tail += String(c)
            }
        }
        sepaName += [[head, num, tail]]
    }
    
    sepaName = sepaName.sorted { ($0[0].lowercased, Int($0[1])!) < ($1[0].lowercased, Int($1[1])!) }
    
    return sepaName.map{$0.joined()}
}