import Foundation

func solution(_ expression:String) -> Int64 {
    var element = [String]()
    var op = [Character]()
    
    // 숫자와 연산자를 배열에 저장
    var prev: Character = " "
    var str = ""
    for c in expression {
        if c.isNumber && !prev.isNumber {
            str.append(c)
        } else if c.isNumber && prev.isNumber {
            str.append(c)
        } else if !c.isNumber {
            element.append(str)
            str = ""
            element.append(String(c))
            
            if !op.contains(c) {
                op.append(c)
            }
        }
        prev = c
    }
    element.append(str)
    
    // 모든 우선순위 경우의 수 찾기
    var orders = [[String]]()
    var visited = [Bool](repeating: false, count: op.count)
    
    func permutation(arr: [String]) {
        if arr.count == op.count {
            orders.append(arr)
            return
        }
        
        for i in 0..<op.count {
            if !visited[i] {
                visited[i] = true
                permutation(arr: arr + [String(op[i])])
                visited[i] = false
            }
        }
    }
    permutation(arr: [])
    
    // 최댓값 구하기
    var maxVal: Int64 = Int64.min
    for order in orders {
        var copy = element
        var i = 0
        for operate in order {
            i = 0
            while copy.contains(operate) {
                guard i < copy.count else { break }
                if copy[i] == operate {
                    switch copy[i] {
                    case "+":
                        copy[i-1] = String(Int(copy[i-1])! + Int(copy[i+1])!)
                    case "-":
                        copy[i-1] = String(Int(copy[i-1])! - Int(copy[i+1])!)
                    case "*":
                        copy[i-1] = String(Int(copy[i-1])! * Int(copy[i+1])!)
                    default: break
                    }
                    copy.remove(at: i)
                    copy.remove(at: i)
                } else {
                    i += 1
                }
            }
        }
        maxVal = max(abs(Int64(copy.first!)!), maxVal)
    }
    
    return maxVal
}