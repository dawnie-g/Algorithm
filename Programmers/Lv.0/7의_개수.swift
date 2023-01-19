import Foundation

func solution(_ array:[Int]) -> Int { array.flatMap{String($0)}.filter{String($0) == "7"}.count }