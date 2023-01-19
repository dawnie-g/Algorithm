import Foundation

func solution(_ sides:[Int]) -> Int { 
    var sortedSides: [Int] = sides.sorted(by:<)
    return sortedSides[0]+sortedSides[1] > sortedSides[2] ? 1 : 2
}