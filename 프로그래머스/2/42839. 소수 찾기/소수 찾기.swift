import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map{String($0)}
    var visited = [Bool](repeating: false, count: numbers.count)
    var array = [Int]()
    
    func recursion(num: String) {
        if !num.isEmpty && num != "1" && !array.contains(Int(num)!)  {
            array.append(Int(num)!)
        }
        
        if num.count == numbers.count { return }
        
        for i in 0..<numbers.count {
            if (num.isEmpty && numbers[i] == "0") || visited[i] { continue }
            visited[i] = true
            recursion(num: num + numbers[i])
            visited[i] = false
        }
    }
    
    recursion(num: "")
    
    return array.filter{
        for i in 2...Int(sqrt(Double(array.max()!)))+1 where $0 % i == 0 && $0 != i {
            return false
        }
        return true
    }.count
}