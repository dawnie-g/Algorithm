let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nmk[0], m = nmk[1], k = nmk[2]
var notebook = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

func tilting(_ sticker: [[Int]], _ angle: Int) -> [[Int]] {
    let c = sticker.count, r = sticker[0].count
    var tilted = [[Int]]()
    switch angle {
    case 90:
        for j in 0..<r {
            var line = [Int]()
            for i in 1...c {
                line.append(sticker[c-i][j])
            }
            tilted.append(line)
        }
    case 180:
        for i in 1...c {
            var line = [Int]()
            for j in 1...r {
                line.append(sticker[c-i][r-j])
            }
            tilted.append(line)
        }
    case 270:
        for j in 1...r {
            var line = [Int]()
            for i in 0..<c {
                line.append(sticker[i][r-j])
            }
            tilted.append(line)
        }
    default: return sticker
    }
    return tilted
}

sticker: for _ in 0..<k { // 스티커 반복문
    let rc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let r = rc[0]
    var sticker = [[Int]]()
    for _ in 0..<r {
        sticker.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    angle: for a in [0, 90, 180, 270] {
         let tilted = tilting(sticker, a)
         let c = tilted.count, r = tilted[0].count
         guard c <= n && r <= m else { continue }

         i:for i in 0...n-c {
             j: for j in 0...m-r {
                 // 검사
                 area: for x in 0..<c {
                     for y in 0..<r {
                         guard notebook[i+x][j+y] & tilted[x][y] == 0 else { continue j }
                     }
                 }
                 // 대입
                 for x in 0..<c {
                     for y in 0..<r {
                         notebook[i+x][j+y] = notebook[i+x][j+y] | tilted[x][y]
                     }
                 }
                 continue sticker
             }
         }
     }
}

print(notebook.flatMap{$0}.filter{$0 == 1}.count)
