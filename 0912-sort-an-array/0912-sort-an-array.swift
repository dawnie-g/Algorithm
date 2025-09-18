class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count == 1 { return nums }

        let count = nums.count
        let list1 = sortArray(Array(nums[0..<count/2]))
        let list2 = sortArray(Array(nums[count/2..<count]))

        let count1 = list1.count
        let count2 = list2.count
        var p1 = 0
        var p2 = 0
        var sorted = [Int]()

        while true {
            if p1 == count1 { sorted += list2[p2..<count2]; break }
            if p2 == count2 { sorted += list1[p1..<count1]; break }

            if list1[p1] <= list2[p2] {
                sorted.append(list1[p1])
                p1 += 1
            } else {
                sorted.append(list2[p2])
                p2 += 1
            }
        }

        return sorted
    }
}