import Foundation

func solution(_ chicken:Int) -> Int {
    var coupon: Int = chicken
    var reward: Int = 0

    while coupon >= 10{
        coupon -= 10
        reward += 1
        coupon += 1
    }

    return reward
}