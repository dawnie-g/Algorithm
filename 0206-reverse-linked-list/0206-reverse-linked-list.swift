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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newHead = head
        while newHead?.next != nil {
            newHead = newHead?.next
        }
        let tail = recursion(head)
        tail?.next = nil
        return newHead
    }

    private func recursion(_ node: ListNode?) -> ListNode? {
        if node?.next == nil { return node }
        let prev = recursion(node?.next)
        prev?.next = node
        return node
    }
}