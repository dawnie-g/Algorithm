import Foundation

func solution(_ number:[Int]) -> Int {
    var zeroSumThree = 0
    for i in 0..<number.count {
        for j in (i+1)..<number.count {
            for k in (j+1)..<number.count {
                if [number[i], number[j], number[k]].reduce(0, +) == 0 {
                    zeroSumThree += 1
                }
            }
        }
    }

    return zeroSumThree
}