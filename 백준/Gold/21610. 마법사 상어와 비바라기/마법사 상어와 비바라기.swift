import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let dir = [(0, 0), (0, -1), (-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1)]
let dia = [(-1, -1), (-1, 1), (1, 1), (1, -1)]
var map = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
var clouds: [(Int, Int)] = [(n-2, 0), (n-2, 1), (n-1, 0), (n-1, 1)]

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let d = dir[input[0]], s = input[1]
    let (dr, dc) = (d.0 * s, d.1 * s)
    
    clouds = clouds.map { (r1, c1) in
        let r2 = (r1 + dr) % n
        let c2 = (c1 + dc) % n
        return (r2 < 0 ? r2 + n : r2, c2 < 0 ? c2 + n : c2)
    }
    
    for cloud in clouds {
        map[cloud.0][cloud.1] += 1
    }
    
    for cloud in clouds {
        let r = cloud.0
        let c = cloud.1
        
        var count = 0
        for d in dia {
            let dr = r + d.0
            let dc = c + d.1
            if 0..<n ~= dr && 0..<n ~= dc && map[dr][dc] > 0 {
                count += 1
            }
        }
        map[r][c] += count
    }
    
    var newClouds: [(Int, Int)] = []
    
    for r in 0..<n {
        for c in 0..<n where map[r][c] > 1 && !clouds.contains(where: { $0 == (r, c) }) {
            newClouds.append((r, c))
            map[r][c] -= 2
        }
    }
    
    clouds = newClouds
}

print(map.flatMap { $0 }.reduce(0, +))
