import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board_stack = [[Int]](repeating: [Int](), count: board.count)
    var line_idx = [Int](repeating: 0, count: board.count)
    var pop_cnt = 0
    
    for line in board {
        for i in 0..<line.count where line[i] != 0 {
            board_stack[i].append(line[i])
        }
    }
    
    var basket = [Int]()
    for move in moves {
        guard board_stack[move-1].count > line_idx[move-1] else { continue }
        let curr_doll = board_stack[move-1][line_idx[move-1]]
        
        if !basket.isEmpty && basket.last! == curr_doll {
            basket.removeLast()
            pop_cnt += 2
        } else {
            basket.append(curr_doll)
        }
        
        line_idx[move-1] += 1
    }
    
    return pop_cnt
}