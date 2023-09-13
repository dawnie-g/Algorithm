let n = Int(readLine()!)!
let table = (0..<n).map{_ in readLine()!.split(separator: " ").map{Int($0)!}}
var team1 = [[Int]]()
var minDiff = 100

func combination(array: [Int], pickCount: Int, index: Int = 0, tempArray: [Int], combsArray: inout [[Int]]) {
    if tempArray.count == pickCount {
        combsArray.append(tempArray)
        return
    }
    
    for i in index..<array.count {
        combination(array: array, pickCount: pickCount, index: i+1, tempArray: tempArray + [array[i]], combsArray: &combsArray)
    }
}

combination(array: Array(0..<n), pickCount: n/2, tempArray: [], combsArray: &team1)

for t1 in team1 {
    let t2 = Array(0..<n).filter{!t1.contains($0)}
    var p1 = 0
    var p2 = 0
    
    for i in 0..<t1.count {
        for j in 0..<t1.count {
            p1 += table[t1[i]][t1[j]]
            p2 += table[t2[i]][t2[j]]
        }
    }
    
    minDiff = min(minDiff, abs(p1-p2))
}

print(minDiff)