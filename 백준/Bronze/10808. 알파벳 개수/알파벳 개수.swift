let string = readLine()!
var result = ""
let alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

for i in alphabet {
    result.append("\(string.filter{$0 == i}.count)")
    result.append(" ")
}

print(result)