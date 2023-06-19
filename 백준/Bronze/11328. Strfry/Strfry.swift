let n = Int(readLine()!)!

for _ in 1...n {
    let line = readLine()!.split(separator: " ").map{String($0)}
    var cnt1 = [Int](repeating: 0, count: 200)
    var cnt2 = [Int](repeating: 0, count: 200)
    
    line[0].forEach { cnt1[Int($0.asciiValue!)] += 1 }
    line[1].forEach { cnt2[Int($0.asciiValue!)] += 1 }
    
    print(cnt1 == cnt2 ? "Possible" : "Impossible")
}