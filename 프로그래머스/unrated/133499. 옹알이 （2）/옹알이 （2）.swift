import Foundation

func solution(_ babbling:[String]) -> Int {
    babbling.filter{
        for t in ["ayaaya", "yeye", "woowoo", "mama"] where $0.contains(t) { 
            return false 
        }
        return true }
    .map{$0.replacingOccurrences(of: "aya", with: " ")}
    .map{$0.replacingOccurrences(of: "ye", with: " ")}
    .map{$0.replacingOccurrences(of: "woo", with: " ")}
    .map{$0.replacingOccurrences(of: "ma", with: " ")}
    .map{$0.replacingOccurrences(of: " ", with: "")}
    .filter{$0 == ""}.count
}