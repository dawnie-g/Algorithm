let nm = readLine()!.split(separator: " ").map{Int($0)!}
var cards = readLine()!.split(separator: " ").map{Int($0)!}

for _ in 0..<nm[1] {
    cards.sort()
    cards[0] += cards[1]
    cards[1] = cards[0]
}

print(cards.reduce(0, +))