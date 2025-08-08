class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        heights.sorted(by: <)
            .enumerated()
            .filter { $0.element != heights[$0.offset] }
            .count
    }
}