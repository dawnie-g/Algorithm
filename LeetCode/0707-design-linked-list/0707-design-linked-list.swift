class Node {
    var val: Int
    var next: Node?

    init(val: Int) {
        self.val = val
        self.next = nil
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
        let next = head
        makeHead(val: val)
        head?.next = next
    }
    
    func addAtTail(_ val: Int) {
        guard var curr = head else { 
            makeHead(val: val)
            return
        }

        while let next = curr.next {
            curr = next
        }

        curr.next = Node(val: val)
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == 0 {
            let next = head
            addAtHead(val)
            head?.next = next
        } else if let prev = getNode(at: index - 1) {
            let new = Node(val: val)
            let next = prev.next
            prev.next = new
            new.next = next
        }
    }
    
    func deleteAtIndex(_ index: Int) {
        if index == 0 { 
            head = head?.next
        } else if let prev = getNode(at: index - 1) {
            prev.next = prev.next?.next
        }
    }

    // MARK: - Helper Methods

    private func makeHead(val: Int) {
        let node = Node(val: val)
        head = node
    }

    private func getNode(at index: Int) -> Node? {
        guard index >= 0 else { return nil }
        var curr = head

        for _ in 0..<index {
            curr = curr?.next
        }

        return curr
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