import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
return (1...number).map{num in
        var count = 0
        for i in 1...Int(sqrt(Double(num)).rounded()) {
            if num % i == 0 {
                count += num / i == i ? 1 : 2
            }
        }
        return count > limit ? power : count
        }.reduce(0,+)
}
