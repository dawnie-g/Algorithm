class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        matrix.flatMap { $0 }.contains(target)
    }
}