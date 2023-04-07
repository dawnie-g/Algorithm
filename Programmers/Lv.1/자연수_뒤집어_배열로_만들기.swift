func solution(_ n:Int64) -> [Int] {
    let array = String(n).map{Int(String($0))!}
    return array.reversed()
}