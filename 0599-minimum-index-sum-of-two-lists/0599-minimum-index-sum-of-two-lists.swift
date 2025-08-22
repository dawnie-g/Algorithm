class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        let len1 = list1.count
        let len2 = list2.count
        var dict1: [String: Int] = [:]
        var dict2: [String: Int] = [:]

        for index in 0..<len1 {
            let string = list1[index]
            if dict1[string] != nil { continue }
            dict1[string] = index
        }

        for index in 0..<len2 {
            let string = list2[index]
            if dict2[string] != nil { continue }
            dict2[string] = index
        }

        var minSum = Int.max
        var ans: [String] = []
        for (string, index1) in dict1 {
            guard let index2 = dict2[string] else { continue }
            let sum = index1 + index2
            
            if minSum > sum {
                minSum = sum
                ans = [string]
            } else if minSum == sum {
                ans.append(string)
            }
        }

        return ans
    }
}