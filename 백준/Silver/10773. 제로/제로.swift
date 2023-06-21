let n = Int(readLine()!)!
var array = [Int]()

for _ in 0..<n {
	let num = Int(readLine()!)!
	if num == 0 {
		array.removeLast()
	} else {
		array.append(num)
	}
}
print(array.reduce(0,+))