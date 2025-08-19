class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let size = temperatures.count
        var stack: [(value: Int, index: Int)] = []
        var answer: [Int] = []

        for i in stride(from: size - 1, to: -1, by: -1) {
            let temp = temperatures[i]
            
            while !stack.isEmpty && stack.last!.value <= temp {
                stack.removeLast()
            }

            answer.append((stack.last?.index ?? i) - i)
            stack.append((temp, i))
        }

        return answer.reversed()
    }
}