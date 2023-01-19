import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    var newArray: [Int] = numbers
    if direction == "right"{
        newArray.insert(newArray.last!, at: 0)
        newArray.removeLast()
    }else if direction == "left"{
        newArray.append(newArray.first!)
        newArray.removeFirst()
    }
    
    return newArray
}