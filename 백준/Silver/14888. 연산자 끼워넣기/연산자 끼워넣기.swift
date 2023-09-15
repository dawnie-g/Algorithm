let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int($0)!}
var operators = readLine()!.split(separator: " ").map{Int($0)!}

var resultMax = Int.min
var resultMin = Int.max

func backTracking(_ depth: Int, _ value: Int) {
    if depth == n {
        resultMax = max(value, resultMax)
        resultMin = min(value, resultMin)
        return
    }
    
    for i in 0..<4 {
        if operators[i] != 0 {
            operators[i] -= 1
            var value = value
            switch i {
            case 0: value += numbers[depth]
            case 1: value -= numbers[depth]
            case 2: value *= numbers[depth]
            case 3: value /= numbers[depth]
            default: continue
            }
            backTracking(depth + 1, value)
            operators[i] += 1
        }
    }
}

backTracking(1, numbers[0])
print(resultMax)
print(resultMin)