
func solution(_ s:String) -> String {
    var ans = ""
    var index = 0
    
    for char in s {
        if char != " " {
            if index == 0 {
                ans += char.uppercased()
            } else {
                ans += char.lowercased()
            }
            index += 1
        } else {
            ans += " "
            index = 0
        }
    }
    
    return ans
}