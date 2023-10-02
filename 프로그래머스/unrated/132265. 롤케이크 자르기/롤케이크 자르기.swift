func solution(_ topping:[Int]) -> Int {
    var a = [Int](repeating: 0, count: 10_001)
    var b = [Int](repeating: 0, count: 10_001)
    var aHas = [Int]()
    var bHas = [Int]()
    var cnt = 0
    var over = false
    
    for i in topping {
        if b[i] == 0 {
            bHas.append(i)
        }
        b[i] += 1
    }
    
    for i in topping {
        guard !over else { break }
        
        if a[i] == 0 {
            aHas.append(i)
        }
        a[i] += 1
        
        if b[i] == 1 {
            bHas.remove(at: bHas.firstIndex(of: i)!)
        } 
        b[i] -= 1
        
        if aHas.count == bHas.count {
            cnt += 1
        } else if aHas.count > bHas.count {
            over = true
        }
    }
    
    return cnt
}