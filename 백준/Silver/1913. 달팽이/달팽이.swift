let n = Int(readLine()!)!
let target = Int(readLine()!)!

var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var snail: (x: Int, y: Int) = (0, 0)
var number = n * n

let dir: [(x: Int, y: Int)] = [(1, 0), (0, 1), (-1, 0), (0, -1)]
var currDir = 0
var ans = (1, 1)

outer: for level in stride(from: n, to: 1, by: -2) {
    var line = level
    
    while true {
        map[snail.x][snail.y] = number
        
        if number == target {
            ans = (snail.x + 1, snail.y + 1)
        }
        
        number -= 1
        line -= 1
        
        if line == 0 {
            currDir = (currDir + 1) % 4 // 방향 전환
            
            switch currDir {
            case 0:
                snail.x += dir[currDir].x
                snail.y += dir[currDir].y
                continue outer
            case 1, 2: line = level - 1
            case 3: line = level - 2
            default: break
            }
        }
        
        // 다음 위치
        snail.x += dir[currDir].x
        snail.y += dir[currDir].y
    }
}
map[snail.x][snail.y] = number
if target == 1 {
    ans = (snail.x + 1, snail.y + 1)
}

var str = ""
map.forEach {
    $0.forEach { str += "\($0) " }
    str += "\n"
}
str += "\(ans.0) \(ans.1)"
print(str)
