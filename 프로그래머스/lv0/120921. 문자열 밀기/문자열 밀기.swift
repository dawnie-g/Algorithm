import Foundation

func solution(_ A:String, _ B:String) -> Int {
    var arrayA = A.map{String($0)}
    var pull: Int = 0

    for char in arrayA{
        if arrayA.joined() == B {return pull}
        arrayA.insert(arrayA.last!, at: 0)
        arrayA.removeLast()
        pull += 1
    }

    return -1
}