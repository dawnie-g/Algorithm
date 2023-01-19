import Foundation

func solution(_ score:[[Int]]) -> [Int] {
    score.map{$0.reduce(0,+)}.map{score.map{$0.reduce(0,+)}.sorted(by: >).firstIndex(of: $0)! + 1}
}