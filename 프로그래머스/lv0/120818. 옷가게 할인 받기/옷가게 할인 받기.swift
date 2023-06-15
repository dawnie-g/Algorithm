import Foundation

func solution(_ price:Int) -> Int {
    switch price{
        case 500000...: return Int(Double(price)*0.8)
        case 300000...: return Int(Double(price)*0.9)
        case 100000...: return Int(Double(price)*0.95)
        default: return price
    }
    
}