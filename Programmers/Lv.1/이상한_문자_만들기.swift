func solution(_ s:String) -> String {
    var sentence = ""
    var count = 0
    var index = sentence.index(sentence.startIndex, offsetBy: 0)
    
    for i in 0..<s.count {
        index = s.index(sentence.startIndex, offsetBy: i)
        if s[index] == " "{
            sentence += " "
            count = 0
            continue
        }
        if count % 2 == 0{
            sentence.append(s[index].uppercased())
        }else {
            sentence.append(s[index].lowercased())
        }
        count += 1
    }
    
    return sentence
}