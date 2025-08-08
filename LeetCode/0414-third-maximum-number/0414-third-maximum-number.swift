class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var count = 0
        var maxArray = Set<Int>()

        for num in nums {
            if maxArray.count < 3 {
                maxArray.insert(num)
                continue
            }

            let currThird = maxArray.min()!
            if currThird < num && !maxArray.contains(num) {
                maxArray.remove(currThird)
                maxArray.insert(num)
            }
        }

        return maxArray.count < 3 ? maxArray.max()! : maxArray.min()!
    }
}