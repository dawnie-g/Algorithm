func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = (0..<str1.count-1).map{String(Array(str1)[$0...$0+1].filter{$0.isLetter}).uppercased()}.filter{$0.count == 2}
    let str2 = (0..<str2.count-1).map{String(Array(str2)[$0...$0+1].filter{$0.isLetter}).uppercased()}.filter{$0.count == 2}
    
    if str1.isEmpty && str2.isEmpty {return 65536}
    
    let dic1 = Dictionary(grouping: str1) {$0}
    let dic2 = Dictionary(grouping: str2) {$0}
    
    let union = dic1.merging(dic2) {$0.count > $1.count ? $0 : $1}.values.flatMap{$0}.count
    let inter = dic1.merging(dic2) {$0.count > $1.count ? $1 : $0}.filter{str1.contains($0.key) && str2.contains($0.key)}.values.flatMap{$0}.count
    
    return Int(Double(inter) / Double(union) * 65536)
}