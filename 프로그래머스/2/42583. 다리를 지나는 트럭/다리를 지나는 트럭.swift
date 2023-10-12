import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waiting = Array(truck_weights.reversed())
    var onBridge = [Int]()
    var head = 0
    var tail = 0
    
    var sumOfWeights = 0
    var cnt = 0
    
    while cnt < truck_weights.count {
        if !onBridge.isEmpty && tail - head == bridge_length {
            if onBridge[head] != 0 {
                cnt += 1
            }
            sumOfWeights -= onBridge[head]
            head += 1
        }
        
        if tail - head < bridge_length && !waiting.isEmpty && sumOfWeights + waiting.last! <= weight {
            sumOfWeights += waiting.last!
            onBridge.append(waiting.removeLast())
        } else {
            onBridge.append(0)
        }
        tail += 1
    }
    
    return tail
}