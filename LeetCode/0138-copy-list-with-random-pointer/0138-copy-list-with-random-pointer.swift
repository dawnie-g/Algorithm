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
        var copy: [Node: Node] = [:]

        while let o = origin {
            copy[o] = curr
            
            if let r = o.random {
                let randomCopy = copy[r] ?? Node(r.val)
                curr?.random = randomCopy
                copy[r] = randomCopy
            }

            guard let next = o.next else { break }
            curr?.next = copy[next] ?? Node(next.val)
            curr = curr?.next
            origin = o.next
        }

        return headCopy
    }
}