func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    (1..<n).map{
        let binary = String(arr1[$0] | arr2[$0], radix: 2)
        let padded = String(repeating: "0", count: n-binary.count) + binary
        return padded.reduce("") {$0 + ($1 == "0" ? " " :"#")}
    }
}