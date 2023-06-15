import Foundation

func solution(_ polynomial:String) -> String {
    var result1 = polynomial
        .components(separatedBy: " ")
        .filter{$0.contains("x")}
        .flatMap{$0 == "x" ? "1" : $0.components(separatedBy: "x").joined()}
        .compactMap{Int($0)}
    
    var result2 = polynomial
        .components(separatedBy: " ")
        .filter{$0 != "+" && !$0.contains("x")}
        .map{Int($0)!}
        .reduce(0, +)
    
    return (result1.reduce(0, +) == 1 ? "x" : result1.reduce(0, +) != 0 ? "\(result1.reduce(0, +))x" : "") + (result1.reduce(0, +) == 0 ? "\(result2)" : result2 != 0 ? " + \(result2)" : "")
}