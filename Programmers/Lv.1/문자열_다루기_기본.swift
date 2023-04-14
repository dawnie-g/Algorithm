func solution(_ s:String) -> Bool {
    s.filter{$0.isNumber} == s && (s.count == 4 || s.count == 6)
}