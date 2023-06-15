import Foundation

func solution(_ my_str:String, _ n:Int) -> [String] {
    var array = [String](repeating: "", count: my_str.count % n == 0 ? my_str.count / n : my_str.count / n + 1)
    
    for i in 0..<my_str.count{
        array[i/n].append(Array(my_str)[i])
    }
    
    return array
}