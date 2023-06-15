import Foundation

func solution(_ denum1:Int, _ num1:Int, _ denum2:Int, _ num2:Int) -> [Int] {
    var frac = [denum1 * num2 + denum2 * num1, num1 * num2]
    var num: Int = 2

    while num != max(frac[0], frac[1]){
        if frac[0] % num == 0 && frac[1] % num == 0{
            frac[0] /= num
            frac[1] /= num
            num = 2
        }else{
            num += 1
        }
    }

    return frac[0] == frac[1] ? [1, 1] : frac
}