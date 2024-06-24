let n = Int(readLine()!)!
var like = [Int: [Int]]()
var order = [Int]()
var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

for _ in 0..<n*n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    like[line[0], default: []] += line[1...4]
    order.append(line[0])
}

// 좌석 배치
for student in order {
    var seat = (-1, -1, -1, -1) // 인접한 좌석의 좋아하는 학생 수, 인접한 좌석 중 빈 좌석의 수, 행, 열
    
    for i in 0..<n {
        for j in 0..<n where map[i][j] == 0 {
            var cnt = 0
            var empty = 0
            
            // 인접 좌석에 대한 조사
            for dir in directions {
                let r = i + dir.0
                let c = j + dir.1
                
                guard 0..<n ~= r && 0..<n ~= c else { continue }
                
                if like[student]!.contains(map[r][c]) {
                    cnt += 1
                } else if map[r][c] == 0 {
                    empty += 1
                }
                
            }
            
            // 좋아하는 학생 수가 많거나, 좋아하는 학생 수가 같더라도 빈 좌석이 많으면 좌석 변경
            if seat.0 < cnt || (seat.0 == cnt && seat.1 < empty) {
                seat = (cnt, empty, i, j)
            }
        }
    }
    map[seat.2][seat.3] = student
}

// 만족도 조사
var score = 0
for i in 0..<n {
    for j in 0..<n {
        let student = map[i][j]
        var cnt = 0
        
        for dir in directions {
            let r = i + dir.0
            let c = j + dir.1
            
            guard 0..<n ~= r && 0..<n ~= c && like[student]!.contains(map[r][c]) else { continue }
            cnt += 1
        }
        
        switch cnt {
        case 1: score += 1
        case 2: score += 10
        case 3: score += 100
        case 4: score += 1000
        default: break
        }
    }
}

print(score)