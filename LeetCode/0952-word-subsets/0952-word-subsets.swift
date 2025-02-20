class Solution {
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        var dict: [Character: Int] = [:]
        for word in words2 {
            var newDict: [Character: Int] = [:]
            for char in word {
                newDict[char, default: 0] += 1 
            }
            
            for (char, newValue) in newDict {
                if newValue > dict[char, default: 0] {
                    dict[char] = newValue
                }
            }
        }

        var ans: [String] = []
        ans.reserveCapacity(words1.capacity)

        for word in words1 {
            var dict = dict
            for char in word {
                guard let cnt = dict[char] else { continue }

                if cnt < 2 {
                    dict[char] = nil
                } else {
                    dict[char] = cnt - 1
                }
            }

            if dict.isEmpty {
                ans.append(word)
            }
        }

        return ans
    }
}