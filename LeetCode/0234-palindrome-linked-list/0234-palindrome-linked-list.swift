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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var curr = head
        var vals = [Int]()
        var head = 0
        var tail = -1

        while curr != nil {
            vals.append(curr!.val)
            tail += 1
            curr = curr?.next
        }

        
        while head < tail {
            if vals[head] != vals[tail] {
                return false
            }

            head += 1
            tail -= 1
        }

        return true
    }
}