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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k > 0 else { return head }
        var head = head
        var n = 0
        var curr = head

        while curr != nil {
            n += 1
            curr = curr?.next
        }
        guard n > 1, k % n != 0 else { return head }

        curr = head
        var count = 0
        while count < n - (k % n) - 1 {
            count += 1
            curr = curr?.next ?? head
        }

        let newHead = curr?.next ?? head
        curr?.next = nil
        curr = newHead

        while curr?.next != nil {
            curr = curr?.next
        }
        curr?.next = head

        return newHead
    }
}