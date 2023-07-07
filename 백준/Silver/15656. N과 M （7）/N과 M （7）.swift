let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let num = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
let n = nm[0], m = nm[1]

var arr = [String]()
var str = ""

func backTracking(_ k: Int) {
    if k == m {
        str += arr.joined(separator: " ")
        str += "\n"
        return
    }
    
    for i in 0..<n {
        arr.append(String(num[i]))
        backTracking(k+1)
        arr.removeLast()
    }
}

backTracking(0)
print(str)