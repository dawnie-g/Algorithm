/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let newHead = head?.next ?? head
        swap(head)
        return newHead
    }

    private func swap(_ node: ListNode?) {
        if node?.next == nil { return }
        let nextSwap = node?.next?.next
        let nextForNow = nextSwap?.next ?? nextSwap
        node?.next?.next = node
        node?.next = nextForNow
        swap(nextSwap)
    }
}