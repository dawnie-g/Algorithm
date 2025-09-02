class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var head = 0
        var tail = numbers.count - 1

        while head < tail {
            let sum = numbers[head] + numbers[tail]

            if sum < target {
                head += 1
            } else if sum > target {
                tail -= 1
            } else {
                return [head + 1, tail + 1]
            }
        }

        return []
    }
}