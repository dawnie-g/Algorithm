class MyCircularQueue {

    var circularQueue: [Int?]
    var head: Int
    var tail: Int
    let size: Int
    
    init(_ k: Int) {
        circularQueue = .init(repeating: nil, count: k)
        head = 0
        tail = 0
        size = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        circularQueue[tail] = value
        tail += 1
        tail %= size
        
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        circularQueue[head] = nil
        head += 1
        head %= size
        return true
    }
    
    func Front() -> Int {
        if let value = circularQueue[head] {
            return value
        } else {
            return -1
        }
    }
    
    func Rear() -> Int {
        let rear = (tail + size - 1) % size
        
        if let value = circularQueue[rear] {
            return value
        } else {
            return -1
        }
    }
    
    func isEmpty() -> Bool {
        return circularQueue[head] == nil
    }
    
    func isFull() -> Bool {
        return circularQueue[tail] != nil
    }
}