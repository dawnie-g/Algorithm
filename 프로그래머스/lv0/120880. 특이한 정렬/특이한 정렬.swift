import Foundation

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    var array = numlist.map{$0-n}.sorted(by: <).sorted{abs($0)>abs($1)}
    
    array.reverse()
    
    return array.map{$0+n}
}
