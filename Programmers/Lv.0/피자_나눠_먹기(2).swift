import Foundation

func solution(_ n:Int) -> Int {
    var pizza: Int = 1
    
    while pizza*6 % n != 0{
        pizza += 1
    }
    
    return pizza
}