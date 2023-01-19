import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    a * 1_000_000 % b == 0 ? 1 : 2
}