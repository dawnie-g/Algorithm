/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head

        while slow != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if slow == nil && fast == nil { return nil }
            if slow === fast { break }
        }

        var pos = head
        while fast !== pos {
            pos = pos?.next
            fast = fast?.next
        }

        return pos
    }
}