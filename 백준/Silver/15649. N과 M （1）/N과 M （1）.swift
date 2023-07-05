let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]
var output = ""
var issued = [Bool](repeating: false, count: n+1)

func bt(_ k: Int) {
    if k == m {
        print(output.dropLast(1))
        return
    }
    
    for i in 1...n {
        if !issued[i] {
            output.append("\(i) ")
            issued[i] = true
            bt(k+1)
            issued[i] = false
            output.removeLast(2)
        }
    }
}

bt(0)