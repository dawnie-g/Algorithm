let nwl = readLine()!.split(separator: " ").map{Int($0)!}
let numberOfTrucks = nwl[0], bridgeWidth = nwl[1], bridgeLimitWeight = nwl[2]
let trucks = readLine()!.split(separator: " ").map{Int($0)!}

var onBridge = [Int](repeating: 0, count: bridgeWidth)
var waitingFirstTruck = 0
var crossedTrucks = 0
var time = 0

while crossedTrucks < numberOfTrucks {
    crossedTrucks += onBridge.removeFirst() > 0 ? 1 : 0
    
    if waitingFirstTruck < numberOfTrucks && onBridge.reduce(0, +) + trucks[waitingFirstTruck] <= bridgeLimitWeight {
        onBridge.append(trucks[waitingFirstTruck])
        waitingFirstTruck += 1
    } else {
        onBridge.append(0)
    }
    
    time += 1
}

print(time)