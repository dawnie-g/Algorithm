import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var ans: Int = Int.max
    var visited: [Bool] = [Bool](repeating: false, count: words.count)
    
    func dfs(_ currIndex: Int, _ count: Int) {
        let currWord = currIndex == -1 ? begin : words[currIndex]
        
        // 현재 단어가 타겟과 같으면 ans와 count를 비교, 더 작은 값을 ans에 할당
        if currWord == target {
            ans = min(count, ans)
            return
        }
        
        // 방문하지 않은 단어와 현재 단어를 비교
        outer: for i in 0..<words.count where visited[i] == false {
            var diffChar = false
            
            // 한 글자씩 비교해가며 다른 글자가 두 개 나오면 비교를 끝내고 다음 단어로 넘어감
            for (char1, char2) in zip(currWord, words[i]) where char1 != char2 {
                if !diffChar { 
                    diffChar = true
                } else {
                    continue outer
                }
            }
            
            // 다른 글자가 하나 있었으면 그 단어로 dfs를 돌림
            if diffChar {
                visited[i] = true
                dfs(i, count + 1)
                visited[i] = false
            }
        }
        
        return
    }
    
    dfs(-1, 0)
    
    return ans == Int.max ? 0 : ans
}