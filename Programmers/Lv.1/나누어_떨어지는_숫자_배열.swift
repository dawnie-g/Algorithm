func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let array = arr.filter{$0 % divisor == 0}.sorted()
    return array.count == 0 ? [-1] : array
}