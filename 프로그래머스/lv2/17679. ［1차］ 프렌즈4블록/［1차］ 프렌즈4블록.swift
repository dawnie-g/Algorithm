func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let board = board.map{$0.map{$0}}
    var rot = [[Character]](repeating: [Character](repeating: " ", count: m), count: n)
    var pop = true
    
    for i in 0..<m {
        for j in 0..<n {
            rot[j][i] = board[i][j]
        }
    }
    
    while pop {
        pop = false
        for i in 0..<n-1 {
            for j in 0..<m-1 {
                guard rot[i][j] != "0" else { continue }
                let shape = rot[i][j].uppercased()
                if rot[i+1][j].uppercased() == shape && rot[i][j+1].uppercased() == shape && rot[i+1][j+1].uppercased() == shape {
                    pop = true
                    rot[i][j] = Character(shape.lowercased())
                    rot[i+1][j] = Character(shape.lowercased())
                    rot[i][j+1] = Character(shape.lowercased())
                    rot[i+1][j+1] = Character(shape.lowercased())
                }
            }
        }
        
        rot = rot.map{$0.filter{$0.isUppercase}}
        rot = rot.map{[Character](repeating: "0", count: m-$0.count) + $0}
    }
    
    return rot.flatMap{$0}.filter{$0 == "0"}.count
}