func solution(_ num:Int) -> Int {
    var toOne = num
    var count = 0
    
    while toOne != 1 {
        if count < 500 {
            count += 1
        }else {
            return -1
        }
        if toOne % 2 == 0 {
            toOne /= 2
        }else {
             toOne = toOne * 3 + 1      
        }
    }
    return count
}