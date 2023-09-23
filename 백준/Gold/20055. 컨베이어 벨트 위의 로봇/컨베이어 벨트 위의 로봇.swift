let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0], k = nk[1]
let belt = readLine()!.split(separator: " ").map{Int($0)!}
var onBelt = Array(belt[0..<n])
var underBelt = Array(belt[n..<2*n].reversed())
var robotLocation = [Int]()
var lv = 0

while onBelt.filter{$0 == 0}.count + underBelt.filter{$0 == 0}.count < k {
    lv += 1
    
    // belt move
    onBelt.insert(underBelt.removeFirst(), at: 0)
    underBelt.append(onBelt.removeLast())
    robotLocation = robotLocation.map{$0 + 1}
    if !robotLocation.isEmpty && robotLocation.first! == n-1 {
        robotLocation.removeFirst()
    }
    
    // robot move
    for i in 0..<robotLocation.count {
        if onBelt[robotLocation[i]+1] > 0 && !robotLocation.contains(robotLocation[i]+1) {
            robotLocation[i] += 1
            onBelt[robotLocation[i]] -= 1
        }
    }
    if !robotLocation.isEmpty && robotLocation.first! == n-1 {
        robotLocation.removeFirst()
    }
    
    // load robot
    if onBelt[0] > 0 {
        robotLocation.append(0)
        onBelt[0] -= 1
    }
}
print(lv)