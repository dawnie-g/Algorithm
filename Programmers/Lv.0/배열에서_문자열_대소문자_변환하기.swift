import Foundation

func solution(_ strArr:[String]) -> [String] {
    (0..<strArr.count).map{$0 % 2 == 0 ? strArr[$0].lowercased() : strArr[$0].uppercased()}
}