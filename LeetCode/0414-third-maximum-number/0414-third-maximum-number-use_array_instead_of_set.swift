class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var count = 0
        var maxArray = [Int]()

        for num in nums {
            let currThird = maxArray.last ?? nil
            if maxArray.count < 3 && !maxArray.contains(num) {
                maxArray.append(num)
            } else if currThird! < num && !maxArray.contains(num) {
                maxArray.removeLast()
                maxArray.append(num)
            }
            maxArray.sort(by: >)
        }
        
        return maxArray.count < 3 ? maxArray.first! : maxArray.last!
    }
}