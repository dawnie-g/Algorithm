import Foundation

func solution(_ food:[Int]) -> String {
    var foodRail = ""
    
    for i in 1..<food.count {
        foodRail += String(repeating: "\(i)", count: food[i]/2)
    }
    
    return foodRail + "0" + foodRail.reversed()
}