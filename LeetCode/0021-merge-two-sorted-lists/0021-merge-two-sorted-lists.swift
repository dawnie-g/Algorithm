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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 else { return list2 }
        guard let list2 else { return list1 }

        var p1: ListNode? = list1
        var p2: ListNode? = list2

        var head: ListNode?

        if list1.val <= list2.val {
            head = p1
            p1 = p1?.next
        } else {
            head = p2
            p2 = p2?.next
        }

        var curr = head

        while true {
            guard p2 != nil else { 
                curr?.next = p1
                break 
            }
            guard p1 != nil else { 
                curr?.next = p2
                break
            }

            if p1!.val <= p2!.val {
                let node = ListNode(p1!.val)
                curr?.next = node
                p1 = p1?.next
            } else {
                let node = ListNode(p2!.val)
                curr?.next = node
                p2 = p2?.next
            }

            curr = curr?.next
        }

        return head
    }
}