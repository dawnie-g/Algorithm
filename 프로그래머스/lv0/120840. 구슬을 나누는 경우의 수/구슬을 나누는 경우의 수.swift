import Foundation

func solution(_ balls:Int, _ share:Int) -> Int {
    var num: Int64 = 1
    
    for i in 0..<balls-share{
        num *= Int64(balls-i)
        num /= Int64(i+1) 
    }
    
    return Int(num)
}