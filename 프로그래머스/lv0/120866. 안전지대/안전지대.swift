import Foundation

func solution(_ board:[[Int]]) -> Int {
    var danger = board
    var i1: Int
    var i2: Int
    
    while danger.flatMap{$0}.contains(1){
        i1 = danger.flatMap{$0}.firstIndex(of: 1)!/board.count
        i2 = danger.flatMap{$0}.firstIndex(of: 1)!%board.count
        
        for i in -1...1{
            for j in -1...1 where (0..<danger.count).contains(i1 + i) && (0..<danger.count).contains(i2 + j){
                guard danger[i1+i][i2+j] == 0 else {continue}
                danger[i1+i][i2+j] = 2
            }
        }
        
        danger[i1][i2] = 2
    }
    return danger.flatMap{$0}.filter{$0 == 0}.count
}