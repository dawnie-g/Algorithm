let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0], m = nm[1]
let locationOfRobot = readLine()!.split(separator: " ").map{ Int($0)! }
var r = locationOfRobot[0]
var c = locationOfRobot[1]
var d = locationOfRobot[2]
var map = (0..<n).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! } }
var cnt = 0

while true {
    if map[r][c] == 0 {
        cnt += 1
        map[r][c] = 2 // cleaning
    }
    
    if map[r][c-1] == 0 || map[r+1][c] == 0 || map[r][c+1] == 0 || map[r-1][c] == 0 {
        d = d == 0 ? 3 : d - 1
        
        switch d {
        case 0: r = map[r-1][c] == 0 ? r - 1 : r
        case 1: c = map[r][c+1] == 0 ? c + 1 : c
        case 2: r = map[r+1][c] == 0 ? r + 1 : r
        case 3: c = map[r][c-1] == 0 ? c - 1 : c
        default: break
        }
        
    } else {
        switch d {
        case 0: r += 1
        case 1: c -= 1
        case 2: r -= 1
        case 3: c += 1
        default: break
        }
        
        if map[r][c] == 1 { break }
    }
}

print(cnt)