var cards = Array(1...20)

for _ in 1...10 {
    let section = readLine()!.split(separator: " ").map{Int($0)!-1}
    var temp = Array(cards[section[0]...section[1]].reversed())
    for i in section[0]...section[1] {
        cards[i] = temp.removeFirst()
    }
}

print(cards.map{String($0)}.joined(separator: " "))
