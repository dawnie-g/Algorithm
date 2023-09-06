let line = readLine()!
var zeroToOne = 0
var oneToZero = 0
var prev: Character = " "

for n in line {
    if prev == "0" && n == "1" {
        zeroToOne += 1
    } else if prev == "1" && n == "0" {
        oneToZero += 1
    }
    prev = n
}

print(zeroToOne != 0 || oneToZero != 0 ? max(zeroToOne, oneToZero) : min(zeroToOne, oneToZero))