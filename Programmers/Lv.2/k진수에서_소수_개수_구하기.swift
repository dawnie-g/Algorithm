import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    String(n, radix: k)
        .components(separatedBy: "0")
        .filter{$0 != "1" && $0 != ""}
        .map{Int($0)!}
        .filter{ 
            var i = 2
            while i * i <= $0 {
                if $0 % i == 0 { return false }
                i += 1
            }
            return true
        }.count
}