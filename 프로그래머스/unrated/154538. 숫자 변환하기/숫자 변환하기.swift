import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var y = y
    var queue = [(y, 0)]
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        if cur.0 == x { 
            return cur.1
        } else if cur.0 > x {
            if cur.0 % 3 == 0 {
                queue.append((cur.0/3, cur.1+1))
            }
            if cur.0 % 2 == 0 {
                queue.append((cur.0/2, cur.1+1))
            }
            queue.append((cur.0-n, cur.1+1))
        }
    }
    
    return -1
}