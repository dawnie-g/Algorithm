class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var hashSet = Set<Int>()

        for num in nums {
            if hashSet.contains(num) {
                hashSet.remove(num)
            } else {
                hashSet.insert(num)
            }
        }

        return hashSet.first!
    }
}