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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var curr = head
        var head = head

        while head?.val == val {
            head = curr?.next
            curr = curr?.next
        }

        while curr != nil {
            if curr?.next?.val == val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
        }

        return head
    }
}