
class MinStack {
    private var stack: [Int]
    private var minStack: [Int]

    init() {
        stack = []
        minStack = []
    }
    
    func push(_ val: Int) {
        if minStack.isEmpty || minStack.last! >= val {
            minStack.append(val)
        }
        
        stack.append(val)
    }
    
    func pop() {
        let val = stack.removeLast()

        if !minStack.isEmpty && val == minStack.last! {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        stack.last!
    }
    
    func getMin() -> Int {
        minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */