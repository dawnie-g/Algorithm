import Foundation

func solution(_ dots:[[Int]]) -> Int {
    var diagonal: [[Int]] = dots.filter{$0 == dots[0] || $0[0] != dots[0][0] && $0[1] != dots[0][1]}
    
    return [abs(diagonal[0][0]-diagonal[1][0]), abs(diagonal[0][1]-diagonal[1][1])].reduce(1, *)
}