class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        let cnt = arr.count
        var newArr = [Int]()
        newArr.reserveCapacity(arr.count)
        var newCnt = 0
        var idx = 0

        // for i in 0..<arr.count where newCnt < cnt {
        //     if arr[i] == 0 {
        //         newArr.append(0)
        //         newCnt += 1
        //     }
        //     if newCnt < cnt {
        //         newArr.append(arr[i])
        //         newCnt += 1
        //     }
        // }

        while newCnt < cnt {
            if arr[idx] == 0 {
                newArr.append(0)
                newCnt += 1
                if newCnt < cnt {
                    newArr.append(0)
                    newCnt += 1
                }
            } else {
                newArr.append(arr[idx])
                newCnt += 1
            }
            idx += 1
        }

        arr = newArr
    }
}