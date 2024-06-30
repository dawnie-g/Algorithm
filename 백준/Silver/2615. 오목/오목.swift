let board = (0..<19).map { _ in readLine()!.split(separator: " ") }
var find = false
var str = "0"

// 행 탐색
outer: for r in 0..<19 {
line: for c in 0..<15 where board[r][c] == "1" || board[r][c] == "2" {
    let first = board[r][c]
    
    for stone in board[r][c...c+4] where stone != first {
        continue line
    }
    
    // 6목이면 continue
    if (c < 14 && board[r][c+5] == first) || (c > 0 && board[r][c-1] == first) {
        continue line
    }
    
    find = true
    str = first + "\n" + "\(r+1) \(c+1)"
    
    break outer
}
}

// 열 탐색
outer: for r in 0..<15 where !find {
line: for c in 0..<19 where board[r][c] == "1" || board[r][c] == "2" {
    let first = board[r][c]
    
    for stone in (1..<5).map{ board[r+$0][c] } where stone != first {
        continue line
    }
    
    // 6목이면 continue
    if (r < 14 && board[r+5][c] == first) || (r > 0 && board[r-1][c] == first) {
        continue line
    }
    
    find = true
    str = first + "\n" + "\(r+1) \(c+1)"
    
    break outer
}
}

// 우하향 탐색
outer: for r in 0..<15 where !find {
line: for c in 0..<15 where board[r][c] == "1" || board[r][c] == "2" {
    let first = board[r][c]
    
    for stone in (1..<5).map{ board[r+$0][c+$0] } where stone != first {
        continue line
    }
    
    if (r > 0 && c > 0 && board[r-1][c-1] == first) ||
        (r < 14 && c < 14 && board[r+5][c+5] == first) {
        continue line
    }
    
    find = true
    str = first + "\n" + "\(r+1) \(c+1)"
    
    break outer
}
}

// 우상향 탐색
outer: for r in 4..<19 where !find {
line: for c in 0..<15 where board[r][c] == "1" || board[r][c] == "2" {
    let first = board[r][c]
    
    for stone in (1..<5).map{ board[r-$0][c+$0] } where stone != first {
        continue line
    }
    
    if (r < 18 && c > 0 && board[r+1][c-1] == first) ||
        (r > 4 && c < 14 && board[r-5][c+5] == first) {
        continue line
    }
    
    find = true
    str = first + "\n" + "\(r+1) \(c+1)"
    
    break outer
}
}

print(str)
