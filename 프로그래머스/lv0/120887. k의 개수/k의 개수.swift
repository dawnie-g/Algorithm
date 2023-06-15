import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
     (i...j).flatMap{String($0)}.filter{String($0).contains(String(k))}.count
}