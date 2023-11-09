import Foundation

var menu = [String:Int]()

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    for i in 0..<orders.count-1 {
        for j in i+1..<orders.count {
            let common = orders[i].filter{orders[j].contains($0)}.sorted()
            guard common.count > 1 else { continue }
            
            for n in course {
                combi(0, [], 0, n, common)
            }
        }
    }
    
    var ans = [(Int, [String])](repeating: (0, [""]), count: course.last! + 1)
    for combi in menu {
        let cnt = combi.key.count
        
        if ans[cnt].0 < combi.value {
            ans[cnt] = (combi.value, [combi.key])
        } else if ans[cnt].0 == combi.value {
            ans[cnt].1.append(combi.key)
        }
    }
    
    return ans.filter{$0.0 != 0}.flatMap{$0.1}.sorted()
}

func combi(_ depth: Int, _ curr: [Character], _ idx: Int, _ targetNum: Int, _ arr: [Character]) {
    if depth == targetNum {
        let c = curr.map{String($0)}.sorted().joined()
        guard !c.isEmpty else { return }
        if !menu.keys.contains(c) {
            menu[c] = 1
        } else {
            menu[c]! += 1
        }
        return
    }

    for i in idx..<arr.count {
        combi(depth + 1, curr + [arr[i]], i + 1, targetNum, arr)
    }
    return
}