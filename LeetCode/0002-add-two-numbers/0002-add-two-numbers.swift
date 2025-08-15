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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 else { return l2 }
        guard let l2 else { return l1 }

        var p1: ListNode? = l1
        var p2: ListNode? = l2
        var carry = 0

        var head: ListNode? = nil
        var curr = head

        while p1 != nil || p2 != nil || carry > 0 {
            let sum = (p1?.val ?? 0) + (p2?.val ?? 0) + carry
            carry = sum / 10
            let node: ListNode? = ListNode(sum % 10)

            if head == nil { 
                head = node
            } else {
                curr?.next = node
            }
            curr = node

            p1 = p1?.next
            p2 = p2?.next
        }

        return head
    }
}