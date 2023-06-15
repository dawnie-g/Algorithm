func solution(_ n:Int) -> Int {
    var prime = Array(repeating: true, count: n+1)
    var count = 0
    
    for i in 2...n {
        if prime[i] { count += 1 }
        for j in 1...n/i {
            prime[i*j] = false
        }
    }
    
    return count
}