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
        var tail = head
        var head = head
        
        while tail?.next != nil {
            let next = tail?.next?.next
            let temp = tail?.next
            tail?.next = next
            temp?.next = head 
            head = temp
        }

        return head
    }
}