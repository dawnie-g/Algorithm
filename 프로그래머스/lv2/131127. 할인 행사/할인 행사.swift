import Foundation

func solution(_ want: [String], _ number: [Int], _ discount: [String]) -> Int {
    var answer = 0
    var needDict = [String: Int]()
    for index in want.indices {
        needDict[want[index]] = number[index]
    }
    var start = 0
    var end = 0
    for index in 0 ... 9 {
        end = index
        if let count = needDict[discount[end]] {
            needDict[discount[end]] = count - 1
        }
    }
    while end < discount.endIndex {
        if 10 < end - start + 1 {
            if let count = needDict[discount[start]] {
                needDict[discount[start]] = count + 1
            }
            start += 1
        }
        if end - start + 1 == 10 {
            if needDict.values.allSatisfy({ $0 <= 0 }) {
                answer += 1
            }
            end += 1
            if end < discount.endIndex {
                if let count = needDict[discount[end]] {
                    needDict[discount[end]] = count - 1
                }
            }
        }
    }
    return answer
}