class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        var sublists = nums.map { [$0] }

        while sublists.count > 1 {
            var newLists = [[Int]]()
            
            for i in 0..<sublists.count/2 {
                let list1 = sublists[i * 2]
                let list2 = sublists[i * 2 + 1]
                var p1 = 0
                var p2 = 0
                var sortedList = [Int]()

                while true {
                    if p1 == list1.count { sortedList += list2[p2..<list2.count]; break }
                    if p2 == list2.count { sortedList += list1[p1..<list1.count]; break }

                    if list1[p1] <= list2[p2] {
                        sortedList.append(list1[p1])
                        p1 += 1
                    } else {
                        sortedList.append(list2[p2])
                        p2 += 1
                    }
                }

                newLists.append(sortedList)
            }
            let last = sublists.count % 2 == 1 ? [sublists.last!] : []
            sublists = newLists + last
        }

        return sublists.first!
    }
}