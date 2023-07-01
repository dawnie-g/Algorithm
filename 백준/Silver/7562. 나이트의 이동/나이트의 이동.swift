let t = Int(readLine()!)!

for _ in 0..<t {
    let len = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map{Int(String($0))!}
    let moveTo = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var board = [[Int]](repeating: [Int](repeating: -1, count: len), count: len)
    board[start[0]][start[1]] = 0
    
    var queue = [(start[0], start[1])]
    var idx = 0
    
    while board[moveTo[0]][moveTo[1]] == -1 {
        let cur = queue[idx]
        idx += 1
        for i in [(2, 1), (2, -1), (-2, 1), (-2, -1), (1, 2), (1, -2), (-1, 2), (-1, -2)] {
            let (nx, ny) = (cur.0 + i.0, cur.1 + i.1)
            guard 0..<len ~= nx && 0..<len ~= ny && board[nx][ny] == -1 else { continue }
            board[nx][ny] = board[cur.0][cur.1] + 1
            queue.append((nx, ny))
        }
    }
    
    print(board[moveTo[0]][moveTo[1]])
}