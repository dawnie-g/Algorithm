/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head else { return nil }
        let headCopy: Node? = Node(head.val)
        var origin: Node? = head
        var curr = headCopy
        var copy: [Node: Node] = [origin!: curr!]

        origin = origin?.next

        while var o = origin {
            curr?.next = Node(origin!.val)
            curr = curr?.next
            copy[o] = curr
            origin = o.next
        }

        origin = head

        while var o = origin {
            guard let random = o.random else { 
                origin = o.next
                continue
            }

            let randomCopy = copy[random]
            let copy = copy[o]

            copy?.random = randomCopy
            origin = o.next
        }

        return headCopy
    }
}