let n = Int(readLine()!)!

func hanoi(_ a: Int, _ b: Int, _ n: Int) {
    if n == 1 { print("\(a) \(b)"); return }
    hanoi(a, 6-a-b, n-1) // k-1개의 원판을 잠시 다른 기둥에 옮겨두는 과정
    print("\(a) \(b)") // k번째 원판을 옮김
    hanoi(6-a-b, b, n-1) // k-1개의 원판을 최종 목적지로 다시 옮기는 과정
}

print((1 << n) - 1)
hanoi(1, 3, n)