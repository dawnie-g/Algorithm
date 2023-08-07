import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]
let map = (0..<n).map{_ in readLine()!.split(separator: " ").map{Int(String($0))!}}

var chicken: [[Int]] = []
var house: [[Int]] = []
for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == 1 {
            house.append([i, j])
        } else if map[i][j] == 2 {
            chicken.append([i, j])
        }
    }
}

var ans: [Int] = []
func cd(_ chosen: [[Int]], _ house: [[Int]]) -> Int {
    var total = 0
    for h in house {
        var distance = 9999
        for c in chosen {
            distance = min(abs(h[0]-c[0]) + abs(h[1]-c[1]), distance)
        }
        total += distance
    }
    return total
}

for i in 0..<(2<<(chicken.count-1)) {
    let bi = String(i, radix: 2)
    let padded = (String(repeating: "0", count: chicken.count - bi.count) + bi).map{$0}
    guard bi.filter{$0 == "1"}.count == m else { continue }
    let chosen = (0..<chicken.count).filter{padded[$0] == "1"}.map{chicken[$0]}
    ans.append(cd(chosen, house))
}
print(ans.min()!)