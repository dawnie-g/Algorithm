import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let match = lottos.filter{win_nums.contains($0)}.count
    let zero = lottos.filter{$0 == 0}.count
    
    return [7-(match + zero) ,7-match].map{$0 == 7 ? 6 : $0}
}