import Foundation

var gears = (0..<4).map{ _ in readLine()!.map{Int(String($0))!} }
let k = Int(readLine()!)!

func spin(_ clockwise: Int, _ gear: Int) {
    if clockwise == 1 {
        gears[gear].insert(gears[gear].removeLast(), at: 0)
    } else {
        gears[gear].append(gears[gear].removeFirst())
    }
}

for _ in 0..<k {
    let rotation = readLine()!.split(separator: " ").map{Int($0)!}
    let startGear = rotation[0]-1
    let ns = [gears[0][2] != gears[1][6], gears[1][2] != gears[2][6], gears[2][2] != gears[3][6]]
    
    spin(rotation[1], startGear)
    
    // right side
    for i in 1...3 {
        let gear = startGear + i
        guard gear < 4 && ns[gear-1] else {break}
        spin(i % 2 == 1 ? rotation[1] * (-1) : rotation[1] , gear)
    }
    
    // left side
    for i in 1...3 {
        let gear = startGear - i
        guard gear >= 0 && ns[gear] else {break}
        spin(i % 2 == 1 ? rotation[1] * (-1) : rotation[1] , gear)
    }
}

print((0...3).map{gears[$0][0] == 1 ? pow(2, $0) : 0}.reduce(0, +))