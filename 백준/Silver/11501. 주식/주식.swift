let t = Int(readLine()!)!

for _ in 0..<t {
    stock(days: Int(readLine()!)!, prices: readLine()!.split(separator: " ").map{Int($0)!}.reversed())
}

func stock(days: Int, prices: [Int]) {
    var maxPrice = prices[0]
    var hold = [Int]()
    var profit = 0
    
    for i in 1..<days {
        if prices[i] >= maxPrice || i == days-1 {
            if i == days-1 {
                hold.append(prices[i])
            }
            profit += hold.map{maxPrice-$0}.reduce(0, +)
            maxPrice = prices[i]
            hold.removeAll()
        } else {
            hold.append(prices[i])
        }
    }
    
    print(profit > 0 ? profit : 0)
}