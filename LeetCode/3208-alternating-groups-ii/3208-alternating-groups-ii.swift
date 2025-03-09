class Solution {
    func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
        let colorsSize = colors.count
        var len = 1
        var alters: [Int] = []

        for i in 0..<colorsSize {
            let curr = colors[i]
            let isCurrLast = i == colorsSize - 1
            let next = isCurrLast ? colors[0] : colors[i+1]
            
            if curr != next {
                len += 1
            } else {
                alters.append(len)
                len = 1
            }

            if isCurrLast && len > 1 {
                if curr != next && !alters.isEmpty {
                    alters[0] += len - 1
                } else {
                    alters.append(len)
                }
            }
        }
        
        if len - 1 == colorsSize {
            return len - 1
        } else {
            return alters.reduce(0) { 
                let curr = $1 - k + 1
                return $0 + (curr > 0 ? curr : 0)
            }
        } 
    }
}