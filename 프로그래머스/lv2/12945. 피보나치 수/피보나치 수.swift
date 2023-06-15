func solution(_ n: Int) -> Int {
    var fibonacci: [Int] = [0, 1] + Array(repeating: 0, count: n-1)
    
    for i in 2...n where n >= 2 {
        fibonacci[i] = (fibonacci[i-2] + fibonacci[i-1]) % 1234567
    }
    
    return fibonacci[n]
}