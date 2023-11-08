import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var possible_id = Array(repeating: [String](), count: user_id.count)
    
    for i in 0..<banned_id.count {
        let banned_count = banned_id[i].count
        
        compare: for id in user_id where id.count == banned_count {
            let banned_array = banned_id[i].map{$0}
            let user_array = id.map{$0}
            
            for j in 0..<banned_count where banned_array[j] != "*" {
                if banned_array[j] != user_array[j] {
                    continue compare
                }
            }
            
            possible_id[i].append(id)
        }
    }
    
    let size = possible_id.filter{!$0.isEmpty}.count
    var combis = [[String]]()
    print(possible_id.filter{!$0.isEmpty})
    func combi(_ depth: Int, _ curr: [String], _ idx: Int) {
        if depth == size {
            if !combis.contains(curr.sorted()) {
                combis.append(curr.sorted())
            }
            return
        }
        
        for i in idx..<size {
            for j in 0..<possible_id[i].count {
                guard !curr.contains(possible_id[i][j]) else { continue }
                combi(depth+1, curr + [possible_id[i][j]], i+1)
            }
            
        }
    }
    combi(0, [], 0)
    
    return combis.count
}