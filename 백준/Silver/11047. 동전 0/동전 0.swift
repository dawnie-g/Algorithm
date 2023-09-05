let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
var cost = nk[1]
var prev = 1
var ans = 0

for _ in 0..<n {
    let coin = Int(readLine()!)!
    
    ans += cost % coin / prev
    cost -= cost % coin
    prev = coin
    
    guard prev <= cost else { break }
}

print(n > 1 ? ans + cost / prev : cost)