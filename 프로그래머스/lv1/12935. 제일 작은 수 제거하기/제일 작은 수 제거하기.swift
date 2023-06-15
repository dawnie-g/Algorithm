func solution(_ arr:[Int]) -> [Int] {
    let min = arr.min()
    return arr.filter{$0 != min}.count > 0 ? arr.filter{$0 != min} : [-1]
}