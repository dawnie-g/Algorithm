let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]

var arr = [Int]()
var str = ""

func backTracking(_ k: Int) {
    if k == m {
        str += arr.map{String($0)}.joined(separator: " ")
        str += "\n"
        return
    }
    
    for i in 1...n {
        arr.append(i)
        backTracking(k+1)
        arr.removeLast()
    }
}

backTracking(0)
print(str)