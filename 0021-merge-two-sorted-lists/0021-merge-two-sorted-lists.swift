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
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }

        var head: ListNode?
        var list1 = list1
        var list2 = list2
        if list1!.val <= list2!.val {
            head = ListNode(list1!.val)
            list1 = list1?.next
        } else {
            head = ListNode(list2!.val)
            list2 = list2?.next
        }

        recur(list1, list2, head)
        return head
    }

    private func recur(_ node1: ListNode?, _ node2: ListNode?, _ tail: ListNode?) {
        if node1?.next == nil && node1!.val <= node2!.val {
            node1?.next = node2
            tail?.next = node1
            return
        } else if node2?.next == nil && node2!.val <= node1!.val {
            node2?.next = node1
            tail?.next = node2
            return
        }

        if node1!.val <= node2!.val {
            tail?.next = node1
            recur(node1?.next, node2, node1)
        } else {
            tail?.next = node2
            recur(node1, node2?.next, node2)
        }
    }
}