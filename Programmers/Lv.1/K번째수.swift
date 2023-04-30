import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    commands.map{array[$0[0]-1..<$0[1]].sorted()[$0[2]-1]}
}