import Foundation

func solution(_ gems:[String]) -> [Int] {
    let gemTypes = Set(gems)
    var ans = (0,gems.count)
    var left = 0, right = 0
    var dict: [String:Int] = [:]
    dict[gems[0]] = 1

    while left < gems.count && right < gems.count {
        if dict.count == gemTypes.count {
            ans = ans.1-ans.0 <= right-left ? ans : (left,right)
            dict[gems[left], default: 0] -= 1
            if dict[gems[left]] == 0 { dict.removeValue(forKey: gems[left]) }
            left += 1
            if left >= gems.count || left >= right { break }
        } else {
            right += 1
            if right >= gems.count { break }
            dict[gems[right],default: 0] += 1
        }
    }

    return [ans.0+1, ans.1+1]
}