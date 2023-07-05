let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]
var arr = [Int](repeating: 0, count: m)
var issued = [Bool](repeating: false, count: n+1)

func bt(_ k: Int) {
    if k == m {
        print(arr.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if !issued[i] {
            arr[k] = i
            issued[i] = true
            bt(k+1)
            issued[i] = false
        }
    }
}

bt(0)