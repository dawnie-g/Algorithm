import Foundation

func solution(_ quiz:[String]) -> [String] {
    quiz.map{
        $0
        .replacingOccurrences(of: "- ", with: "-")
        .replacingOccurrences(of: "--", with: "")
        .components(separatedBy: " ")
        .filter{$0 != "=" && $0 != "+"}
    }.map{Int($0[0])! + Int($0[1])! == Int($0[2])! ? "O" : "X"} 
}