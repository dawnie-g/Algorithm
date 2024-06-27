/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var queue = [root]
        var next = [TreeNode?]()
        var ans = [[root!.val]]

        while !queue.isEmpty {
            for node in queue {
                guard let node = node else { continue }
                if let leftChild = node.left {
                    next.append(leftChild)
                }

                if let rightChild = node.right {
                    next.append(rightChild)
                }
            }
            if !next.isEmpty {
                ans.append(next.map { $0!.val })
            }
            queue = next
            next = []
        }

        return ans
    }
}