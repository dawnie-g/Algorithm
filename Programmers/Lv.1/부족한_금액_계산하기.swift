import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let fee = (1...count).map{price * $0}.reduce(0, +)
    return Int64(fee > money ? fee - money : 0)
}