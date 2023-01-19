func solution(_ n:Int) -> Int {
    var fatorial: Int = 1
    var i: Int = 0
    
    repeat {
        i += 1
        fatorial *= i
    }while fatorial <= n / i
    
    return n == 1 ? 1 : i
}