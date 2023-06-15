import Foundation

func solution(_ n:Int) -> Int {
    var pizzaCount = 1

    while (pizzaCount * 7) < n {
        pizzaCount += 1
    }

    return pizzaCount
}