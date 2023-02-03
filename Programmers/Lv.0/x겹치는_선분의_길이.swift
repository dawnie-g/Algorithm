import Foundation

func solution(_ lines:[[Int]]) -> Int {
    var points: [[Int]] = [[],[],[]]
    var length: Int = 0
    
    for i in 0..<lines.count {
        for j in i+1..<lines.count{

            guard max(lines[i][0], lines[j][0]) <= min(lines[i][1], lines[j][1]) else {continue}
            guard Array(max(lines[i][0], lines[j][0])...min(lines[i][1], lines[j][1])).count > 1 else {continue}
            
            points[i] = Array(max(lines[i][0], lines[j][0])...min(lines[i][1], lines[j][1])).filter{!points.flatMap{$0}.contains($0)}
            
        }
    }
    
    if points.flatMap{$0}.count == 0 {return 0}
    
    for i in 0..<points.flatMap{$0}.count-1 where points.flatMap{$0}[i+1] == points.flatMap{$0}[i] + 1 {
        length += 1
    }

    return 0
}