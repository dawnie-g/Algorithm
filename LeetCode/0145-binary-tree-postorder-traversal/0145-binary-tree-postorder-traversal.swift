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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var ans = [Int]()
        var curr = root
        var lastVisited: TreeNode? = nil

        while curr != nil || !stack.isEmpty {
            while let node = curr {
                stack.append(node)
                curr = node.left
            }

            let peekNode = stack.last!
            if let rightChild = peekNode.right, lastVisited?.val != rightChild.val {
                curr = rightChild
            } else {
                ans.append(peekNode.val)
                lastVisited = stack.removeLast()
            }
        }
        return ans
    }
}