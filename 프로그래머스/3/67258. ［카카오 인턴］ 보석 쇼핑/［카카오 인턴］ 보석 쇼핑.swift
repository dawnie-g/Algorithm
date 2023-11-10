import Foundation

func solution(_ gems:[String]) -> [Int] {
    var included = [String:Int]()
    for gem_name in Dictionary(grouping: gems, by: {$0}) {
        included[gem_name.key] = 0
    }
    let type_cnt = included.count
    var included_cnt = 0
    
    var section = [String](repeating: "", count: 100_001)
    var head = 1
    var tail = 1
    var ans = [-100_000, 100_000]
    
    func add(gem: String) {
        tail += 1
        if let cnt = included[gem] {
            if cnt == 0 {
                included_cnt += 1
            }
            included[gem] = cnt + 1
        }
    }
    
    func rm(gem: String) {
        head += 1
        if let cnt = included[gem] {
            included[gem] = cnt - 1
        }
    }
    
    for i in 0..<gems.count {
        section[tail] = gems[i]
        add(gem: gems[i])
        
        // 추가한 gem과 맨 앞 gem이 같으면 맨 앞 gem 제거
        if head != tail-1 && section[head] == section[tail-1] {
            rm(gem: section[head])
            
            // 가장 앞의 중복된 gem 제거
            func del() {
                while section[head] == section[head+1] {
                    rm(gem: section[head])
                }
                if let cnt = included[section[head]] {
                    if cnt > 1 {
                        rm(gem: section[head])
                        del()
                    }
                }
            }
            del()
        }
        
        if included_cnt == type_cnt && tail - head - 1 < ans[1] - ans[0]{
            ans = [head, tail-1]
        }
    }
    
    return ans
}