import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    photo.map{ $0.map{ name.contains($0) ? yearning[name.firstIndex(of: $0)!] : 0 }.reduce(0,+) }
}