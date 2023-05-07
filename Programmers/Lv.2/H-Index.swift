import Foundation

func solution(_ citations:[Int]) -> Int {
    (1...citations.count).map{ h in citations.filter{$0 >= h}.count >= h}.filter{$0 == true}.count
}