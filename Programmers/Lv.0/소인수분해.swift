import Foundation

func solution(_ n:Int) -> [Int] {
    var prime_factor: [Int] = []
    var temp: Int = n
    var num: Int = 2
    
    while temp != 1{
        if temp % num == 0{
            temp /= num
            if !prime_factor.contains(num){
                prime_factor.append(num)
            }
            num = 2
        }else{
            num += 1
        }
    }
    
    return prime_factor
}