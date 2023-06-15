var height = [Int]()

for _ in 1...9 {
    height.append(Int(readLine()!)!)
}

var gameover = false
var liar: [Int] = [0, 0]
for i in 0...8 {
    liar[0] = height[i]
    for j in i+1...8 {
        liar[1] = height[j]
        
        if height.filter{!liar.contains($0)}.reduce(0, +) == 100 {
            print(height.filter{!liar.contains($0)}.sorted().map{String($0)}.joined(separator: "\n"))
            gameover = true
            break
        }
    }
    if gameover { break }
}
