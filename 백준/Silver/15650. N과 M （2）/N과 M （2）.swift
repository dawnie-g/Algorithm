let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]

var issued = [Bool](repeating: false, count: 100)
var arr = [Int]()

func backTracking(_ k: Int) {
    if k == m {
        print(arr.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if !issued[i] && (arr.isEmpty || (!arr.isEmpty && arr.last! < i)) {
            arr.append(i)
            issued[i] = true
            backTracking(k+1)
            issued[i] = false
            arr.removeLast()
        }
    }
}

backTracking(0)