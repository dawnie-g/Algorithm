func solution(_ n:Int, _ m:Int) -> [Int] {
    var GCD, LCM: Int!
    
    GCD = (1...n).filter{n % $0 == 0 && (1...m).filter{m % $0 == 0}.contains($0)}.max()
    
    LCM = (1...n*m).filter{$0 % n == 0 && $0 % m == 0}.min()
    
    return [GCD, LCM]
}