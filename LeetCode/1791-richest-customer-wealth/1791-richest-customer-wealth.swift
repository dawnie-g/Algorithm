class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
       let aa = accounts.map { acc in
            return acc.reduce(0, +)
       } 

       return aa.flatMap{ $0 }.max() ?? 0

    }
}