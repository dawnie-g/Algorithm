func BinaryZero(_ array: [Int], _ n: Int) -> [String] {
    var bins = array.map{String($0, radix: 2)}
    
    for i in 0..<bins.count {
        let zero = String(repeatElement("0", count: n-bins[i].count))
        bins[i] = zero + bins[i]
    }

    return bins
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let bin1 = BinaryZero(arr1, n)
    let bin2 = BinaryZero(arr2, n)
    
    return zip(bin1, bin2).map{(b1, b2) in
        var bin: [String] = []
        for i in 0..<n {
            bin.append(Array(b1)[i] == "0" && Array(b2)[i] == "0" ? " " : "#")
        }
        return bin.map{String($0)}.joined()
    }
}