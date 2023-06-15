import Foundation

func solution(_ s:String) -> [Int] {
    var bi = s
    var count = 0
    var zero = 0
    
    while bi != "1"{
        zero += bi.filter{$0 == "0"}.count
        bi = String(bi.filter{$0 == "1"}.count, radix: 2)
        count += 1
    }
    
    return [count, zero]
}