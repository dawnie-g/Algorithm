import Foundation

func solution(_ emergency:[Int]) -> [Int] {
    var emergency = emergency
    var priority = [Int](repeating: 0, count: emergency.count)
    
    for num in 1...emergency.count{
        priority[emergency.firstIndex(of: emergency.max()!)!] = num
        emergency[emergency.firstIndex(of: emergency.max()!)!] = 0
    }
    
    return priority
}