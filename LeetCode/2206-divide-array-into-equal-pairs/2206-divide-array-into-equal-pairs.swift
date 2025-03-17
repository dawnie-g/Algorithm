class Solution {
    func divideArray(_ nums: [Int]) -> Bool {
        var array = [Bool](repeating: false, count: 501)

        for num in nums {
            array[num].toggle()
        }

        return array.allSatisfy({ $0 == false })
    }
}