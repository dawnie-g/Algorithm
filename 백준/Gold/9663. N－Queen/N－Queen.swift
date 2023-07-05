let q = Int(String(readLine()!))!

var col = [Bool](repeating: false, count: q)
var dia1 = [Bool](repeating: false, count: 2*q)
var dia2 = [Bool](repeating: false, count: 2*q)

var cnt = 0
func backTracking(_ x: Int) {
    if x == q {
        cnt += 1
        return
    }
    
    for y in 0..<q {
        guard col[y] == false && dia1[x+y] == false && dia2[x-y+q-1] == false else { continue }
        if !col[y] {
            col[y] = true
            dia1[x+y] = true
            dia2[x-y+q-1] = true
            backTracking(x+1)
            col[y] = false
            dia1[x+y] = false
            dia2[x-y+q-1] = false
        }
    }
}

backTracking(0)
print(cnt)