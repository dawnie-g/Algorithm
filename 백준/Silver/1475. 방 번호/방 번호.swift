let roomNumber = readLine()!.map{Int(String($0))!}
var number = Array(repeating: 0, count: 10)

for n in roomNumber {
    number[n] += 1
}

let reverse = (number[6] + number[9]) % 2 == 0 ? (number[6] + number[9]) / 2 : (number[6] + number[9]) / 2 + 1

number[6] = reverse
number[9] = reverse

print(number.max()!)