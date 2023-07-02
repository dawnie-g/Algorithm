let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
let (a, b, c) = (abc[0], abc[1], abc[2])

func multi(_ b: Int) -> Int {
    if b == 0 { return 1 }
    var val = multi(b/2)
    val = val * val % c
    if b % 2 == 0 { return val }
    return val * a % c
}

print(multi(b))