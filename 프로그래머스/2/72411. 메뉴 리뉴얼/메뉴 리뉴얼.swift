import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var menu = [String:Int]()
    
    for i in 0..<orders.count-1 {
        for j in i+1..<orders.count {
            let common = orders[i].filter{orders[j].contains($0)}.sorted()
            
            guard common.count > 1 else { continue }
            for n in course {
                func combi(_ depth: Int, _ curr: [Character], _ idx: Int) {
                    if depth == n {
                        let c = curr.map{String($0)}.sorted().joined()
                        guard !c.isEmpty else { return }
                        if !menu.keys.contains(c) {
                            menu[c] = 1
                        } else {
                            menu[c]! += 1
                        }
                        return
                    }

                    for i in idx..<common.count {
                        combi(depth + 1, curr + [common[i]], i + 1)
                    }
                    return
                }
                combi(0, [], 0)
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