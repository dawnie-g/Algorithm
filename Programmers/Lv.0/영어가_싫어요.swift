func solution(_ numbers:String) -> Int64 {
    var num = [String](repeating: "", count: numbers.count)
    var num_index: Int = 0
    
    for char in numbers{
        num[num_index].append(char)
        switch num[num_index] {
        case "one":
            num[num_index] = "1"
            num_index += 1 
        case "two":
            num[num_index] = "2"
            num_index += 1 
        case "three":
            num[num_index] = "3"
            num_index += 1 
        case "four":
            num[num_index] = "4"
            num_index += 1 
        case "five":
            num[num_index] = "5"
            num_index += 1 
        case "six":
            num[num_index] = "6"
            num_index += 1 
        case "seven":
            num[num_index] = "7"
            num_index += 1 
        case "eight":
            num[num_index] = "8"
            num_index += 1 
        case "nine":
            num[num_index] = "9"
            num_index += 1 
        case "zero":
            num[num_index] = "0"
            num_index += 1 
        default:
            break
        }
    }
    
    return Int64(num.filter{$0 != ""}.joined())!
}