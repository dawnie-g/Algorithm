import Foundation

func solution(_ n:Int, _ numlist:[Int]) -> [Int] { numlist.filter{$0 % n == 0} }