let t = Int(readLine()!)!

for _ in 0..<t {
    let xy = readLine()!.split(separator: " ").map{Int($0)!}
    var distance = xy[1] - xy[0]
    var move = 1
    
    while distance > move * 2 {
        distance -= move * 2
        move += 1
    }
    
    print(distance == 0 ? (move-1)*2 : distance > move ? move*2 : move*2-1)
}