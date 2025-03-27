let block = readLine()!.split(separator: " ").map { Int($0)! }
let width = block[0], height = block[1]
let total = height * 2 + width * 2

let shopCount = Int(readLine()!)!
var list: [Int] = (0...shopCount).map { _ in
    let location = readLine()!.split(separator: " ").map { Int($0)! }
    switch location[0] {
    case 1: return location[1]
    case 2: return width * 2 + height - location[1]
    case 3: return total - location[1]
    case 4: return width + location[1]
    default: return 0
    }
}
let dong = list.removeLast()
var ans = 0
list.forEach { shop in
    let clock = abs(dong - shop)
    let counterClock = total - clock
    ans += min(clock, counterClock)
}

print(ans)