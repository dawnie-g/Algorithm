import Foundation

func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 || num == 0 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    var convertedNum = String(n, radix: k)
    var stack: [Character] = []
    var primes: [Int] = []
    while !convertedNum.isEmpty {
        let next = convertedNum.removeFirst()
        if next == "0" && !stack.isEmpty {
            var check: [Character] = []
            while !stack.isEmpty {
                check.insert(stack.removeLast(), at: 0)
            }
            let num = Int(String(check))!
            if isPrime(num: num) {
                primes.append(num)
            }
        } else {
            stack.append(next)
        }
    }
    var check: [Character] = []
    while !stack.isEmpty {
        check.insert(stack.removeLast(), at: 0)
    }
    let num = Int(String(check))!
    if isPrime(num: num) {
        primes.append(num)
    }
    return primes.count
}