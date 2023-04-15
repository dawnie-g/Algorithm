
func solution(_ s:String) -> String {
    var words = s.split(separator: " ").map{Array($0.lowercased())}
    var result = ""
    
    for i in 0..<words.count{
        words[i][0] = Character(words[i][0].uppercased())
    }
    
    words.map{word in
        word.map{String($0)}.joined()
    }
    
    result += words[0]
    words.removeFirst()
    
    for i in 0..<s.count{
        if Array(s)[i] == " " {
            result += " "
        }else if i > 0 && Array(s)[i-1] == " "{
            result += words[0]
            words.removeFirst()
            
        }
    }
    
    return result
}