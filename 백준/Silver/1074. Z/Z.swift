let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, r, c) = (input[0], input[1], input[2])

func z(_ n: Int, _ r: Int, _ c: Int) -> Int {
    if n == 0 { return 0 }
    let half = 1<<(n-1) // 2의 n-1제곱: 한 변 길이의 절반
    if r < half && c < half { return z(n-1, r, c) }
    if r < half && c >= half { return half * half + z(n-1, r, c-half) }
    if r >= half && c < half { return 2 * half * half + z(n-1, r-half, c) }
    return 3 * half * half + z(n-1, r-half, c-half)
}

print(z(N, r, c))