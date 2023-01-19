import Foundation

func solution(_ sides:[Int]) -> Int {
    (abs(sides[0] - sides[1]) + 1...sides.max()!).count + (sides.max()! + 1..<sides.reduce(0, +)).count
}