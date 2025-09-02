class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var array = [1]
        array.reserveCapacity(30)

        for row in 0..<rowIndex {
            var prev = 1

            for i in 1..<array.count {
                let temp = array[i]
                array[i] += prev
                prev = temp
            }

            array.append(1)
        }

        return array
    }
}