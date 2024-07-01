import Foundation

func solution(_ s:String) -> Int {
    let n = s.count
    guard n > 1 else { return 1 }
    
    let s = s.map{ String($0) }
    var minVal = n
    
    for i in 1...n/2 {
        var str = 0
        var prev = [String]()
        var cnt = 1
        var to = n
        if n % i != 0 {
            to = n / i * i
        }
        
        for j in stride(from: 0, to: to, by: i) {
            let slice = s[j..<j+i].map { String($0) }
            if prev.isEmpty {
                prev = slice
                cnt = 1
            } else if slice == prev {
                cnt += 1
            } else {
                str += cnt > 99 ? i + 3 : cnt > 9 ? i + 2 : cnt > 1 ? i + 1 : i
                prev = slice
                cnt = 1
            }
        }
        
        str += cnt > 99 ? i + 3 : cnt > 9 ? i + 2 : cnt > 1 ? i + 1 : i
        if n % i != 0 {
            str += n % i
        }
        minVal = min(minVal, str)
    }
    
    return minVal
}