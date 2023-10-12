import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waiting = Array(truck_weights.reversed())
    var onBridge = [Int](repeating: 0, count: bridge_length)
    var sumOfWeight = 0
    var cnt = 0
    var time = 0
    
    while cnt < truck_weights.count {
        if onBridge.first! != 0 {
            sumOfWeight -= onBridge.first!
            cnt += 1
        }
        onBridge.removeFirst()
        time += 1
        
        if !waiting.isEmpty && sumOfWeight + waiting.last! <= weight {
            sumOfWeight += waiting.last!
            onBridge.append(waiting.removeLast())
        } else {
            onBridge.append(0)
        }
    }
    
    return time
}