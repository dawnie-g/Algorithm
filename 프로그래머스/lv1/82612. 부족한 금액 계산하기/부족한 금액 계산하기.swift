import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    Int64((1...count).map{price * $0}.reduce(0, +) > money ? (1...count).map{price * $0}.reduce(0, +) - money : 0)
}