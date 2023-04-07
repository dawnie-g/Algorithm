import Foundation

func solution(_ s:String) -> Bool {
    s.filter{$0 == "P" || $0 == "p"}.count == s.filter{$0 == "Y" || $0 == "y"}.count
}