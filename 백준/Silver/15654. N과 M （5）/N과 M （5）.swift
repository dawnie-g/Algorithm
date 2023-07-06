let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let num = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
let n = nm[0], m = nm[1]

var arr = [Int]()
var issued = [Bool](repeating: false, count: n)
var str = ""

func backTracking(_ k: Int) {
    if k == m {
        arr.forEach{ str += "\($0) " }
        str.removeLast()
        str += "\n"
        return
    }
    
    for i in 0..<n {
        if !issued[i] {
            arr.append(num[i])
            issued[i] = true
            backTracking(k+1)
            arr.removeLast()
            issued[i] = false
        }
    }
}

backTracking(0)
print(str)