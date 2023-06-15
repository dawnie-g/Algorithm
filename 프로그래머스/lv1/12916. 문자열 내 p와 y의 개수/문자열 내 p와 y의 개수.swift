import Foundation

func solution(_ s:String) -> Bool {
    s.map{$0}.filter{$0 == "P" || $0 == "p"}.count == s.map{$0}.filter{$0 == "Y" || $0 == "y"}.count
    
}