func solution(_ arr:[Int]) -> Int {
    var lcm = arr[0]
    var gcd: Int = 0
    
    for i in 1..<arr.count {
        gcd = (1...min(lcm, arr[i])).filter{lcm % $0 == 0 && arr[i] % $0 == 0 }.last!
        lcm = lcm * arr[i] / gcd
    }
    
    return lcm
}