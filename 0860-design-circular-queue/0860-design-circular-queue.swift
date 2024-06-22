class MyCircularQueue {

    private var bufferRing: [Int]
    private var head: Int
    private var tail: Int

    init(_ k: Int) {
        bufferRing = .init(repeating: -1, count: k)
        head = 0
        tail = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        if isEmpty() {
            bufferRing[head] = value
        } else {
             bufferRing[tail] = value
        }
        if bufferRing[circularNext(from: tail)] == -1 {
            tail = circularNext(from: tail)
        }
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        bufferRing[head] = -1
        if bufferRing[circularNext(from: head)] != -1 {
            head = circularNext(from: head)
        }
        if isEmpty() {
            tail = head
        } else if bufferRing[tail] != -1, bufferRing[circularNext(from: tail)] == -1 {
            tail = circularNext(from: tail)
        }
        return true
    }
    
    func Front() -> Int {
        bufferRing[head]
    }
    
    func Rear() -> Int {
        if isEmpty() {
            -1
        } else if isFull() {
            bufferRing[tail]
        } else {
            bufferRing[circularPrev(from: tail)]
        }
    }
    
    func isEmpty() -> Bool {
        bufferRing[head] == -1 && bufferRing[tail] == -1
    }
    
    func isFull() -> Bool {
        bufferRing[head] != -1 && bufferRing[tail] != -1
    }

    private func circularNext(from index: Int) -> Int {
        index + 1 < bufferRing.count ? index + 1 : 0
    }

    private func circularPrev(from index: Int) -> Int {
        index - 1 >= 0 ? index - 1 : bufferRing.count - 1
    }
}