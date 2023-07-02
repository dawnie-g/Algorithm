let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = abc[0], b = abc[1], c = abc[2]

func multi(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if b == 1 { return a % c }
    var val = multi(a, b/2, c)
    val = val * val % c
    if b % 2 == 0 { return val }
    return val * a % c
}

print(multi(a, b, c))