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
    func isValidBST(_ node: TreeNode?, _ minVal: Int = Int.min, _ maxVal: Int = Int.max) -> Bool {
        var valid = true

        if let left = node?.left {
            valid = valid && left.val > minVal && left.val < maxVal
            valid = valid && left.val < node!.val && isValidBST(left, minVal, min(maxVal, node!.val))
        }

        if let right = node?.right {
            valid = valid && right.val > minVal && right.val < maxVal
            valid = valid && right.val > node!.val && isValidBST(right, max(minVal, node!.val), maxVal)
        }

        return valid
    }
}