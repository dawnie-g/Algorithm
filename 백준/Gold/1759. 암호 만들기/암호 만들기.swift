let lc = readLine()!.split(separator: " ").map{Int(String($0))!}
let l = lc[0], c = lc[1]
let letters = readLine()!.split(separator: " ").map{Character(String($0))}.sorted()

var isUsed = [Bool](repeating: false, count: c)
var aeiou = 0
let vowel: [Character] = ["a", "e", "i", "o", "u"]
var ans = ""

func backTracking(_ depth: Int, _ line: String, _ prev: Character) {
    guard l - aeiou > 1 else { return }
    if depth == l && aeiou > 0 {
        ans += line + "\n"
        return
    }
    for i in 0..<c where !isUsed[i] && letters[i].asciiValue! > prev.asciiValue! {
        if vowel.contains(letters[i]) { aeiou += 1 }
        isUsed[i] = true
        backTracking(depth+1, line + "\(letters[i])", letters[i])
        isUsed[i] = false
        if vowel.contains(letters[i]) { aeiou -= 1 }
    }
}

backTracking(0, "", "_")
print(ans)