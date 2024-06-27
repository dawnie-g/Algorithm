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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var ans = [Int]()
        var curr = root

        while curr != nil || !stack.isEmpty {
            while let node = curr {
                stack.append(node)
                curr = node.left
            }

            curr = stack.removeLast()
            ans.append(curr!.val)

            curr = curr?.right
        }

        return ans
    }
}