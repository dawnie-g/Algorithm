func solution(_ n:Int) -> Int {
    var prev = 1
    var ans = 0
    var next = prev + ans
    
    for _ in 1...n {
        ans = next
        next = (ans + prev) % 1234567
        prev = ans
    }
    
    return ans
}