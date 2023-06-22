var cards = Array(1...Int(readLine()!)!)
var head = 0

while cards.count > head {
    // throw
    head += 1
    
    // restack
    guard cards.count > head else { break }
    cards.append(cards[head])
    head += 1
}

print(cards.last!)