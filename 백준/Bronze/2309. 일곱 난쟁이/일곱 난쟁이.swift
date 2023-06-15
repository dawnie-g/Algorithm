var height = (0..<9).map{_ in Int(readLine()!)!}
var liar: [Int] = [0, 0]

outerLoop: for i in 0...8 {
    liar[0] = height[i]
    for j in i+1...8 {
        liar[1] = height[j]
        
        if height.filter{!liar.contains($0)}.reduce(0, +) == 100 {
            print(height.filter{!liar.contains($0)}.sorted().map{String($0)}.joined(separator: "\n"))
            break outerLoop
        }
    }
}