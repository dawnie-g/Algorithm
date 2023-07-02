let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = abc[0], b = abc[1], c = abc[2]

func multi(_ b: Int) -> Int {
    if b == 1 { return a % c }
    var val = multi(b/2)
    val = val * val % c
    if b % 2 == 0 { return val }
    return val * a % c
}

print(multi(b))