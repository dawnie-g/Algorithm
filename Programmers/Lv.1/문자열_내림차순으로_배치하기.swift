func solution(_ s:String) -> String {
    s.sorted(by: >).map{String($0)}.joined()
}