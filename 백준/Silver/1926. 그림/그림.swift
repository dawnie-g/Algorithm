let size = readLine()!.split(separator: " ").map{Int($0)!}
let n = size[0], m = size[1]
var arr = [[Int]]()
var answer = [Int]()

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for i in 0..<n {
    for j in 0..<m{
        if arr[i][j] == 1 {
            answer.append(bfs(i,j))
        }
    }
}

print(answer.count)
print(answer.max() ?? 0)

func bfs(_ r:Int, _ c:Int) -> Int {
    let dx = [-1,1,0,0], dy = [0,0,-1,1]
    
    var queue = [(r,c)]
    var idx = 0
    arr[r][c] = 0
    
    while queue.count > idx {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let (nx,ny) = (x + dx[i], y + dy[i])
            
            if (0..<n).contains(nx)&&(0..<m).contains(ny) && arr[nx][ny] == 1 {
                arr[nx][ny] = 0
                queue.append((nx,ny))
            }
        }
    }
    return queue.count
}