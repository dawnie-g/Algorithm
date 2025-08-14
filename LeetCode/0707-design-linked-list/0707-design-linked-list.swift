class Node {
    var val: Int
    var next: Node?
    var prev: Node?

    init(val: Int) {
        self.val = val
        self.next = nil
        self.prev = nil
    }

    init(val: Int, next: Node?) {
        self.val = val
        self.next = next
        self.prev = nil
    }

    init(val: Int, prev: Node?) {
        self.val = val
        self.next = nil
        self.prev = prev
    }

    init(val: Int, next: Node?, prev: Node?) {
        self.val = val
        self.next = next
        self.prev = prev
    }
}

class MyLinkedList {
    var head: Node?

    init() {
        head = nil
    }
    
    func get(_ index: Int) -> Int {
        getNode(at: index)?.val ?? -1
    }
    
    func addAtHead(_ val: Int) {
        let node = Node(val: val, next: head)
        head?.prev = node
        head = node
    }
    
    func addAtTail(_ val: Int) {
        guard var curr = head else { 
            addAtHead(val)
            return
        }

        while let next = curr.next {
            curr = next
        }

        let tail = Node(val: val, prev: curr)
        curr.next = tail
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == 0 {
            addAtHead(val)
        }
        
        guard let prev = getNode(at: index - 1) else { return } 
        let next = prev.next
        let new = Node(val: val, next: next, prev: prev)
        next?.prev = new
        prev.next = new
    }
    
    func deleteAtIndex(_ index: Int) {
        if index == 0 { 
            head = head?.next
        } else if let node = getNode(at: index) {
            let prev = node.prev
            prev?.next = node.next
            node.next?.prev = prev
        }
    }

    // MARK: - Helper Methods

    private func getNode(at index: Int) -> Node? {
        guard index >= 0 else { return nil }
        var curr = head

        for _ in 0..<index {
            curr = curr?.next
        }

        return curr
    }

    private func printList(_ method: String) {
        var str = ""
        var curr = head
        while curr != nil {
            str.append("\(curr!.val) ")
            curr = curr?.next
        }
        print(method, str)
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */