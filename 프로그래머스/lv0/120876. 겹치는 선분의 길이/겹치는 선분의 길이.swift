import Foundation

func solution(_ lines:[[Int]]) -> Int {
    var points: [[Int]] = []
    var index = 0
    
    points.append(Array(lines[0][0]...lines[0][1]))
    points.append(Array(lines[1][0]...lines[1][1]))
    points.append(Array(lines[2][0]...lines[2][1]))
    
    for i in 0...2 {
        // remain overlapping point
        points[i] = points[i].filter{points[(i+1)%3].contains($0) || points[(i+2)%3].contains($0)}
        
        // remove overlapping point of other lines
        points[(i+1)%3] = points[(i+1)%3].filter{!points[i].contains($0)}
        points[(i+2)%3] = points[(i+2)%3].filter{!points[i].contains($0)}
    }
    
    var nums = points.filter{$0.count > 1}.flatMap{$0}.sorted()
    points = [[],[],[]]
    
    for n in 0..<nums.count {
        points[index].append(nums[n])
        
        guard n < nums.count - 1 else {continue}
        if nums[n+1] != nums[n] + 1 {
            index += 1
        }
    }
    
    return points.filter{$0.count > 1}.map{$0.count-1}.reduce(0, +)
}