
class MyCircularQueue {
    private var queue: [Int?]
    private let size: Int
    private var head: Int
    private var tail: Int

    init(_ k: Int) {
        size = k
        queue = [Int?](repeating: nil, count: size)
        head = 0
        tail = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }

        queue[tail] = value
        tail = (tail + 1) % size

        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }

        queue[head] = nil
        head = (head + 1) % size

        return true
    }
    
    func Front() -> Int {
        queue[head] ?? -1
    }
    
    func Rear() -> Int {
        queue[(tail + size - 1) % size] ?? -1
    }
    
    func isEmpty() -> Bool {
        queue[head] == nil
    }
    
    func isFull() -> Bool {
        head == tail && queue[head] != nil
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */