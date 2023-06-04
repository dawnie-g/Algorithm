import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    
    var array = [[Int]](repeating: [], count: num_list.count/n)
    
    for i in 0..<array.count{
        for j in i*n..<i*n+n{
            array[i].append(num_list[j])
        }
    }
    
    return array
}
