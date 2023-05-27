import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    var max = 0
    var min = 0

    for operation in operations {
        if operation.first! == "I" {
            print(operation.dropFirst(2))
            queue.append(Int(String(operation.dropFirst(2)))!)
        } else if !queue.isEmpty {
            if operation == "D 1" {
            queue.remove(at: queue.firstIndex(of: max)!)
            } else if operation == "D -1" {
            queue.remove(at: queue.firstIndex(of: min)!)
            }
        }
        guard !queue.isEmpty else { continue }
        max = queue.max()!
        min = queue.min()!
    }

    return queue.isEmpty ? [0, 0] : [max, min]
}