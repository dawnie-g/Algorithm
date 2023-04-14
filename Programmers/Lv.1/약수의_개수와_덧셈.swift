import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    return (left...right)
        .map{num in 
            (1...num).filter{num % $0 == 0}.count % 2 == 0 ? num : -num }
        .reduce(0, +)
}