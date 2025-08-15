/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    func flatten(_ head: Node?) -> Node? {
        var stack: [Node?] = []
        var curr = head

        while curr != nil {
            if let child = curr?.child {
                stack.append(curr?.next)
                curr?.child = nil
                curr?.next = child
                child.prev = curr
            } else if curr?.next == nil, !stack.isEmpty {
                let parent = stack.removeLast()
                curr?.next = parent
                parent?.prev = curr
            } else {
                curr = curr?.next
            }
        }

        return head
    }
}