func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    let turn = (0...t*m).flatMap{String($0, radix: n).uppercased()}
    var ans = ""
    for i in 0..<turn.count where (i+1) % m == p % m {
        ans += String(turn[i])
        if ans.count == t { break }
    }
    
    return ans
}