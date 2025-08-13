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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var odd = curr
        var even = curr?.next
        let evenHead = even

        curr = curr?.next?.next
        var n = 3

        while curr != nil {
            if n % 2 == 1 {
                odd?.next = curr
                odd = odd?.next
            } else {
                even?.next = curr
                even = even?.next
            }

            curr = curr?.next
            n += 1
        }

        even?.next = nil
        odd?.next = evenHead

        return head
    }
}