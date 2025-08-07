class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        nums.sorted { $0 % 2 == 0 && $1 % 2 == 1 }
    }
}