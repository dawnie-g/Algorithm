import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    
    for operation in operations {
        let operation = operation.components(separatedBy: " ")
        let command = operation[0]
        guard let data = Int(operation[1]) else { continue }
        
        switch command {
            case "I":
            queue.append(data)
            
            case "D":
            guard !queue.isEmpty else { continue }
            guard let value = data == 1 ? queue.max() : queue.min(),
                  let index = queue.firstIndex(of: value) else { continue }
            queue.remove(at: index)
            
            default: continue
        }
    }
    
    return [queue.max() ?? 0, queue.min() ?? 0]
}